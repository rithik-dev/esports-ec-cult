import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/models/instructor.dart';
import 'package:esports_ec/widgets/custom_back_button.dart';
import 'package:esports_ec/widgets/my_button.dart';
import 'package:esports_ec/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';

class InstructorScreen extends StatelessWidget {
  static const id = 'InstructorScreen';

  final Instructor instructor;

  const InstructorScreen({
    Key? key,
    required this.instructor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text(
            'Trainer\'s Profile',
            style: TextStyle(fontSize: 22),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instructor.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                MyCachedNetworkImage(
                  url: instructor.image,
                  height: 300,
                  width: double.infinity,
                ),
                const SizedBox(width: 10),
                Text(
                  instructor.description,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color:
                      instructor.rating <= index ? Colors.white : Colors.orange,
                );
              }),
            ),
            const SizedBox(height: 10),
            _buildReviews(),
          ],
        ),
      ),
    );
  }

  Widget _buildReviews() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final review = instructor.reviews[index];
              return EasyContainer(
                color: Theme.of(context).cardColor,
                alignment: null,
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.title,
                      style: const TextStyle(fontSize: 22),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      review.description,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
            itemCount: instructor.reviews.length,
          ),
        ),
        const SizedBox(height: 15),
        MyButton(
          text: 'Book Now',
          isBold: true,
          onTap: () {},
        ),
      ],
    );
  }
}
