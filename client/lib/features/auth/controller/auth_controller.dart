import 'package:get/get.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';

class AuthController extends GetxController {
  final AuthRemoteRepository _repo = AuthRemoteRepository();

  var user = Rxn<UserModel>();
  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final result = await _repo.login(email: email, password: password);

    result.fold((failure) => Get.snackbar('登录失败', failure.message), (userData) {
      user.value = userData;
      Get.offAllNamed('/home');
    });

    isLoading.value = false;
  }

  Future<void> register(String name, String email, String password) async {
    isLoading.value = true;
    final result = await _repo.registerUser(
      name: name,
      email: email,
      password: password,
    );

    result.fold((failure) => Get.snackbar('注册失败', failure.message), (userData) {
      user.value = userData;
      Get.offAllNamed('/home');
    });
    isLoading.value = false;
  }

  void logout() {
    user.value = null;
    Get.offAllNamed('/login');
  }
}
