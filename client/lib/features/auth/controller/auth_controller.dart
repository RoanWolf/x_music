import 'package:client/core/storage/user_info.dart';
import 'package:get/get.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final AuthRemoteRepository _repo = AuthRemoteRepository();

  var user = Rxn<UserModel>();
  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final result = await _repo.login(email: email, password: password);

    result.fold((failure) => Get.snackbar('登录失败', failure.message), (userData) {
      user.value = userData;
      String token = userData.token;
      saveUserToStorage(userData);
      setUserTokenToStorage(token);
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

    result.fold(
      (failure) {
        Get.closeAllSnackbars();
        Get.snackbar('注册失败', failure.message);
      },
      (userData) {
        Get.closeAllSnackbars();
        user.value = userData;
        String token = userData.token;

        saveUserToStorage(userData);
        setUserTokenToStorage(token);
        
        Get.offAllNamed('/home');
      },
    );
    isLoading.value = false;
  }

  void logout() {
    user.value = null;
    GetStorage().remove('user');
    GetStorage().remove('token');
    Get.offAllNamed('/login');
  }
}
