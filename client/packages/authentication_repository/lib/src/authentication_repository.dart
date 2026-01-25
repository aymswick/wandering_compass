import 'dart:async';
import 'dart:convert';

import 'package:authentication_repository/src/token_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared/shared.dart' show logger;

///
class AuthenticationRepository {
  ///
  AuthenticationRepository({
    required this.tokenStorage,
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'localhost:8080'; // TOOD(ant): remove hardcode
  final http.Client _httpClient;

  final TokenStorage tokenStorage;

  final _controller = StreamController<AuthenticationStatus>.broadcast();

  /// Stream to provide auth status to downstream listeners throughout the app
  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unknown;
    // 1. Check for existing token on app startup
    final token = await tokenStorage.getAccessToken();
    if (token != null) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  /// Log in an existing user
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _httpClient.post(
        Uri.http(_baseUrl, '/auth/login'), // TODO(ant): upgrade to .https
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': email,
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Login response error code: ${response.statusCode}');
      }

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final accessToken = body['data']['accessToken'] as String;
      final refreshToken = body['data']['refreshToken'] as String;

      await tokenStorage.saveToken(type: TokenType.access, token: accessToken);
      await tokenStorage.saveToken(
        type: TokenType.refresh,
        token: refreshToken,
      );

      _controller.add(AuthenticationStatus.authenticated);
    } catch (e) {
      logger.e(e);
      _controller.add(AuthenticationStatus.unauthenticated);
      rethrow;
    }
  }

  /// Register a new user
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _httpClient.post(
        Uri.http(_baseUrl, '/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': email,
          'password': password,
        }),
      );

      logger.d(response);

      if (response.statusCode != 201) {
        throw Exception('Error signing up: ${response.statusCode}');
      }
    } catch (e) {
      logger.e(e);
    }
  }
}

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
