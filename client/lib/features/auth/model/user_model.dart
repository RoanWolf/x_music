import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final int id;
  final String token;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.token,
  });

  UserModel copyWith({
    String? name,
    String? email,
    int? id,
    String? token,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      id: map['id'] as int,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, id: $id, token: $token)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.id == id &&
      other.token == token;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      id.hashCode ^
      token.hashCode;
  }
}
