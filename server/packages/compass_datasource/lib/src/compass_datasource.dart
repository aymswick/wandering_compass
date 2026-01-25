import 'package:shared/shared.dart';

/// Datasource contract for Schedule
abstract class CompassDatasource {
  /// Create and return the newly created schedule.
  Future<Schedule> create(Map<String, dynamic> map);

  /// Create and return user
  Future<User?> createUser({
    required String username,
    required String passwordHash,
  });

  /// Delete the schedule with the provided [id] if one exists.
  Future<void> delete(int id);

  /// Get user by ID
  Future<User?> fetchUserById(
    String id,
  );

  /// Get user by username
  Future<User?> fetchUserByUsername(String id);

  /// Gets a verifiable user credential (hashed secret)
  Future<(User?, String?)?> getUserWithHash(String username);

  /// Return a schedule with the provided [id] if one exists.
  Future<Schedule?> read(int id);

  /// Return all schedules.
  Future<List<Schedule>> readAll();

  /// Update the schedule with the provided [id] to match [schedule] and
  /// return the updated schedule.
  Future<Schedule> update(int id, Schedule schedule);

  /// In a JWT auth model, update the refresh token
  Future<void> updateRefreshToken({
    required String userId,
    required String token,
  });
}
