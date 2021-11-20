import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/models/instructor.dart';
import 'package:esports_ec/utils/app_theme.dart';
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
            _buildReviews(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReviews(BuildContext context) {
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: AppTheme.dialogInsetPadding,
                        backgroundColor: Theme.of(context).cardColor,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  review.description,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
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
          onTap: () => _bookNow(context),
        ),
      ],
    );
  }

  void _bookNow(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => _BookNowDialog(instructor: instructor),
    );
  }
}

class _BookNowDialog extends StatefulWidget {
  // static const id = '_BookNowDialog';

  final Instructor instructor;

  const _BookNowDialog({
    Key? key,
    required this.instructor,
  }) : super(key: key);

  @override
  __BookNowDialogState createState() => __BookNowDialogState();
}

class __BookNowDialogState extends State<_BookNowDialog> {
  String? _selectedLevel;

  Widget _buildTile(String text, InstructorLevel level) {
    return RadioListTile<String>(
      title: Text(
        '$text @₹${level.price}',
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        '${level.hours} hours',
        style: const TextStyle(fontSize: 16),
      ),
      groupValue: _selectedLevel,
      controlAffinity: ListTileControlAffinity.trailing,
      value: text,
      onChanged: (v) => setState(() => _selectedLevel = v),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: AppTheme.dialogInsetPadding,
      backgroundColor: Theme.of(context).cardColor,
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTile('Bronze', widget.instructor.bronze),
          _buildTile('Silver', widget.instructor.silver),
          _buildTile('Gold', widget.instructor.gold),
          const SizedBox(height: 10),
          MyButton(
            text: 'Book',
            isBold: true,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
