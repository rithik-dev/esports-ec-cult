import 'package:esports_ec/models/course.dart';

class Trainer {
  late final String id;
  late final String name;
  late final double rating;
  late final String image;
  late final String description;
  late final List<Course> courses;

  factory Trainer.example() => Trainer.fromJson({
        'id': '1',
        'name': 'Robert California',
        'rating': 4.5,
        'description':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
        'image':
            'https://images.unsplash.com/photo-1593642634524-b40b5baae6bb?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1632&q=80',
        'courses': [],
      });

  Trainer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    image = json['image'];
    description = json['description'];
    courses = json['courses']
        .map(
          (e) => Course.fromJson(e),
        )
        .cast<Course>()
        .toList();
  }
}
