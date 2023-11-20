class UserModel {
  final String name;
  final String email;
  final UserType type;
  final bool active;
  final int id;

  UserModel(
      {required this.name,
      required this.email,
      required this.id,
      this.type = UserType.student,
      this.active = true});

  UserModel.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        id = map['id'],
        type = UserType.values.firstWhere((type) => type.index == map['type']),
        active = map['active'];
}

enum UserType {
  admin,
  student,
}
