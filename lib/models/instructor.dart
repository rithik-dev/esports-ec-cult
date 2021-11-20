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
  late final InstructorLevel bronze;
  late final InstructorLevel silver;
  late final InstructorLevel gold;

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
    bronze = InstructorLevel.fromJson({
      'name': 'bronze',
      ...json['bronze'],
    });
    silver = InstructorLevel.fromJson({
      'name': 'silver',
      ...json['silver'],
    });
    gold = InstructorLevel.fromJson({
      'name': 'gold',
      ...json['gold'],
    });
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

class InstructorLevel {
  late final String name;
  late final int hours;
  late final int price;

  InstructorLevel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hours = json['hours'];
    price = json['price'];
  }
}
