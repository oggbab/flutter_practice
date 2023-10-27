class Users {
  final String id;
  String password;

  Users({required this.id, required this.password});

  Map<String, dynamic> toMap() {
    return {'id': id, "password": password};
  }
}