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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final trainer = Trainer.example();
        return TrainerCard(trainer);
      },
      itemCount: 10,
    );
  }
}
