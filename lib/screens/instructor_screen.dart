import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/controllers/user_controller.dart';
import 'package:esports_ec/models/instructor.dart';
import 'package:esports_ec/utils/app_theme.dart';
import 'package:esports_ec/utils/helpers.dart';
import 'package:esports_ec/widgets/custom_back_button.dart';
import 'package:esports_ec/widgets/my_button.dart';
import 'package:esports_ec/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class InstructorScreen extends StatefulWidget {
  static const id = 'InstructorScreen';

  final Instructor instructor;

  const InstructorScreen({
    Key? key,
    required this.instructor,
  }) : super(key: key);

  @override
  State<InstructorScreen> createState() => _InstructorScreenState();
}

class _InstructorScreenState extends State<InstructorScreen> {
  late Razorpay razorPay;

  @override
  void initState() {
    super.initState();

    razorPay = Razorpay();

    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) async {}

  void handlerErrorFailure(PaymentFailureResponse response) async {
    Helpers.showSnackBar(
      context,
      text: 'Something went wrong!',
    );
  }

  void handlerExternalWallet(ExternalWalletResponse response) {}

  void openCheckout(int amount, String? email) {
    var options = {
      "key": "rzp_live_L9GwPvLqbmqkQ8",
      "amount": amount * 100,
      "name": "Esports ECult",
      "description": "Start Learning!!!",
      "prefill": {"email": email},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorPay.open(options);
    } catch (e) {
      Helpers.showSnackBar(
        context,
        text: 'Something went wrong!',
      );
    }
  }

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
                  widget.instructor.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                MyCachedNetworkImage(
                  url: widget.instructor.image,
                  height: 300,
                  width: double.infinity,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.instructor.description,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: widget.instructor.rating <= index
                      ? Colors.white
                      : Colors.orange,
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
              final review = widget.instructor.reviews[index];
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
            itemCount: widget.instructor.reviews.length,
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
      builder: (context) => _BookNowDialog(
        instructor: widget.instructor,
        onBook: (level) => openCheckout(
          level.price,
          UserController.of(context, listen: false).user?.email,
        ),
      ),
    );
  }
}

class _BookNowDialog extends StatefulWidget {
  // static const id = '_BookNowDialog';

  final Instructor instructor;
  final void Function(InstructorLevel) onBook;

  const _BookNowDialog({
    Key? key,
    required this.instructor,
    required this.onBook,
  }) : super(key: key);

  @override
  __BookNowDialogState createState() => __BookNowDialogState();
}

class __BookNowDialogState extends State<_BookNowDialog> {
  late InstructorLevel _selectedLevel;

  Widget _buildTile(String text, InstructorLevel level) {
    return RadioListTile<InstructorLevel>(
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
      value: level,
      onChanged: (v) => setState(() => _selectedLevel = level),
    );
  }

  @override
  void initState() {
    _selectedLevel = widget.instructor.bronze;
    super.initState();
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
              widget.onBook(_selectedLevel);
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
