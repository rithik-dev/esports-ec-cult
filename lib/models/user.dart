class User {
  late final String id;
  late final String username;
  late final String name;
  late final String image;
  late final String email;
  late final int age;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    image = json['image'];
    name = json['name'];
    age = json['age'];
  }
}
