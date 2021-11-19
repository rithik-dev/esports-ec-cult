import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  static const id = 'MyButton';

  final String text;
  final bool isBold;
  final VoidCallback? onTap;

  const MyButton({
    Key? key,
    required this.text,
    this.isBold = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EasyContainer(
        onTap: onTap,
        alignment: null,
        showBorder: true,
        color: Colors.transparent,
        customPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        borderColor: Theme.of(context).colorScheme.secondary,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
