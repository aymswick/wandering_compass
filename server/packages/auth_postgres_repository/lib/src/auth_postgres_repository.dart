import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:compass_datasource/compass_datasource.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:shared/shared.dart';
import 'package:uuid/uuid.dart';

/// {@template auth_postgres_repository}
/// Postgres implementation of AuthRepository
/// {@endtemplate}
class AuthPostgresRepository implements AuthRepository {
  /// {@macro auth_postgres_repository}
  AuthPostgresRepository(
    this._datasource,
  ) {
    assert(
      _secret != null,
      'JWT_SECRET environment variable must not be null.',
    );
  }

  final CompassDatasource _datasource;
  // TODO(ant): this should technically be an AuthDatasource, but I'm keeping my users in the same database
  final String? _secret = Platform.environment['JWT_SECRET'];
  final _dbcrypt = DBCrypt();

  /// Get user by id
  Future<User?> createUser(String username, String passwordHash) async {
    final user = await _datasource.createUser(
      username: username,
      passwordHash: passwordHash,
    );
    return user;
  }

  /// Get user by id
  Future<User?> getUser(String id) async {
    final user = await _datasource.fetchUserById(id);
    logger.d(user);
    return user;
  }

  @override
  Future<Map<String, String>> login(String username, String password) async {
    final loginResult = await _datasource.getUserWithHash(username);
    final user = loginResult?.$1;
    final hash = loginResult?.$2;

    final isPasswordValid = _dbcrypt.checkpw(password, hash!);

    if (!isPasswordValid) {
      throw Exception('Invalid credentials');
    }

    // Create short-lived Access Token (Stateless)
    final accessToken = JWT({'sub': user?.id}).sign(
      SecretKey(_secret!),
      expiresIn: const Duration(minutes: 15),
    );

    // Create long-lived Refresh Token (Stateful)
    final newToken = const Uuid().v4();

    await _datasource.updateRefreshToken(userId: user!.id!, token: newToken);

    return {
      'accessToken': accessToken,
      'refreshToken': newToken,
    };
  }

  @override
  Future<Map<String, String>> refresh(String refreshToken) {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  Future<User> register(String username, String password) async {
    try {
      // Check if user already exists
      final existingUser = await _datasource.fetchUserByUsername(username);

      if (existingUser != null) {
        throw Exception('Username already taken');
      }

      final hashedPassword = _dbcrypt.hashpw(
        password,
        _dbcrypt.gensalt(),
      ); // TODO(ant): verify entropy on these defaults

      final newUser = await _datasource.createUser(
        username: username,
        passwordHash: hashedPassword,
      );

      return User(id: newUser!.id, username: newUser.username);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<User> validateToken(String token) async {
    try {
      // Verify the signature using your environment secret
      final jwt = JWT.verify(
        token,
        SecretKey(Platform.environment['JWT_SECRET']!),
      );

      // Extract the ID from the payload
      final payload = jwt.payload as Map<String, dynamic>;
      final userId = payload['sub'] as String;

      return User(id: userId, username: '');
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
