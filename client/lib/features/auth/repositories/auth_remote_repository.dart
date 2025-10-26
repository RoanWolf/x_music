import 'package:client/core/failure/app_failure.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fpdart/fpdart.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    const String url = 'http://10.0.2.2:3000/v1/api/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final resBody = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return Left(AppFailure(resBody['msg']));
      }

      final userMap = resBody['user'] as Map<String, dynamic>;
      return Right(UserModel.fromMap(userMap));
    } catch (e) {
      // print(e.toString());
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    const String url = 'http://10.0.2.2:3000/v1/api/register';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      final resBody = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return Left(AppFailure(resBody['msg']));
      }
      final userMap = resBody['user'] as Map<String, dynamic>;
      return Right(UserModel.fromMap(userMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
