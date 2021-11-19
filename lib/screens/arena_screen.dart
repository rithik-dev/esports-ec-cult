import 'package:esports_ec/models/trainer.dart';
import 'package:esports_ec/widgets/trainer_card.dart';
import 'package:flutter/material.dart';

class ArenaScreen extends StatelessWidget {
  static const id = 'ArenaScreen';

  const ArenaScreen({
    Key? key,
  }) : super(key: key);

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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final trainer = Trainer.example();
            return TrainerCard(trainer);
          },
          itemCount: 10,
        ),
      ],
    );
  }
}
