class Course {
  late final String id;
  late final String name;
  late final String instructor;
  late final String image;
  late final String level;
  late final String description;
  late final List<_Lesson> lessons;
  late final double rating;

  factory Course.example() => Course.fromJson({
        'id': '1',
        'name': 'Introduction to the game',
        'instructor': 'Robert California',
        'level': 'Intro',
        'description':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
        'image':
            'https://images.unsplash.com/photo-1593642634524-b40b5baae6bb?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1632&q=80',
        'rating': 4.8,
        'lessons': [
          {
            'id': '1',
            'title': 'Lesson 1',
            'duration': '10:20 minutes',
          },
          {
            'id': '2',
            'title': 'Lesson 2',
            'duration': '10:20 minutes',
          },
          {
            'id': '3',
            'title': 'Lesson 3',
            'duration': '10:20 minutes',
          },
          {
            'id': '4',
            'title': 'Lesson 4',
            'duration': '10:20 minutes',
          },
          {
            'id': '5',
            'title': 'Lesson 5',
            'duration': '10:20 minutes',
          },
          {
            'id': '6',
            'title': 'Lesson 6',
            'duration': '10:20 minutes',
          },
        ],
      });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    instructor = json['instructor'];
    image = json['image'];
    description = json['description'];
    rating = json['rating'];
    level = json['level'];
    lessons = json['lessons']
        .map((e) => _Lesson.fromJson(e))
        .cast<_Lesson>()
        .toList();
  }
}

class _Lesson {
  late final String id;
  late final String title;
  late final String duration;

  _Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
  }
}
