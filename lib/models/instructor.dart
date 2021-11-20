import 'package:cloud_firestore/cloud_firestore.dart';

class Instructor {
  late final String id;
  late final String name;
  late final int rating;
  late final List<_Review> reviews;
  late final int studentsEnrolled;
  late final String instaId;
  late final String description;
  late final String twitchId;
  late final String image;
  late final _Level bronze;
  late final _Level silver;
  late final _Level gold;

  factory Instructor.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final _json = (snapshot.data() ?? {}) as Map<String, dynamic>;
    _json['id'] = snapshot.id;
    return Instructor._fromJson(_json);
  }

  Instructor._fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['imageUrl'];
    rating = json['rating'].toInt();
    reviews = json['reviews']
        .map((e) => _Review.fromJson(e))
        .cast<_Review>()
        .toList();
    description = json['description'];
    studentsEnrolled = json['studentsEnrolled'];
    instaId = json['instaId'];
    twitchId = json['twitchId'];
    bronze = _Level.fromJson(json['bronze']);
    silver = _Level.fromJson(json['silver']);
    gold = _Level.fromJson(json['gold']);
  }
}

class _Review {
  late final String title;
  late final String description;

  _Review.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }
}

class _Level {
  late final int hours;
  late final int price;

  _Level.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    price = json['price'];
  }
}
