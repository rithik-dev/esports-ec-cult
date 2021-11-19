import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  static const id = 'CustomBackButton';

  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Navigator.canPop(context)) return const SizedBox.shrink();

    return EasyContainer(
      margin: 5,
      borderRadius: 10,
      color: Colors.white.withOpacity(0.5),
      onTap: () => Navigator.pop(context),
      child: const Icon(
        Icons.arrow_back_ios_sharp,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}
