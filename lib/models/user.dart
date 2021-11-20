import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late final String id;
  late final String username;
  late final String name;
  // late final String? image;
  late final String email;
  late final int age;

  factory User.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final _json = (snapshot.data() ?? {}) as Map<String, dynamic>;
    _json['id'] = snapshot.id;
    return User._fromJson(_json);
  }

  User._fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    // image = json['image'];
    name = json['name'];
    age = json['age'];
  }
}
