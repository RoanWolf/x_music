import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRemoteRepository {
  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    const String url = 'http://10.0.2.2:8000/auth/register';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    print(response.body);
  }

  Future<void> login({required String email, required String password}) async {
    const String url = 'http://127.0.0.1:8000/auth/login';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    print(response.body);
  }
}
