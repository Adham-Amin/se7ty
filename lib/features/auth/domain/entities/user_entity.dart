class UserEntity {
  final String id;
  final String name;
  final String email;
  final String userType;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    userType: json['userType'],
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}
