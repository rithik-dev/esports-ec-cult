import 'package:esports_ec/models/instructor.dart';
import 'package:esports_ec/repositories/main_repository.dart';
import 'package:esports_ec/widgets/custom_loader.dart';
import 'package:esports_ec/widgets/instructor_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'HomeScreen';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static final _trainersFuture = MainRepository.getInstructors();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
          child: Text(
            'Trainers For You',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<List<Instructor>?>(
          future: _trainersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final instructor = snapshot.data?[index];
                  if (instructor == null) {
                    return const SizedBox.shrink();
                  } else {
                    return InstructorCard(instructor);
                  }
                },
                itemCount: snapshot.data?.length ?? 0,
              );
            } else {
              return const CustomLoader();
            }
          },
        ),
      ],
    );
  }
}
