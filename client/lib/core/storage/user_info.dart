import 'package:client/features/auth/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

void saveUserToStorage(UserModel user) {
  final box = GetStorage();
  box.write('user', user.toMap());
}

UserModel getUserFromStorage() {
  final box = GetStorage();
  final userMap = box.read('user');
  return UserModel.fromMap(userMap);
}


void setUserTokenToStorage(String token) {
  final box = GetStorage();
  box.write('token', token);
}

String getUserTokenFromStorage() {
  final box = GetStorage();
  return box.read('token');
}
