import 'package:esports_ec/controllers/user_controller.dart';
import 'package:esports_ec/screens/bottom_nav_screen.dart';
import 'package:esports_ec/utils/helpers.dart';
import 'package:esports_ec/widgets/loading_overlay.dart';
import 'package:esports_ec/widgets/my_button.dart';
import 'package:esports_ec/widgets/my_text_field.dart';
import 'package:esports_ec/widgets/onboarding_background.dart';
import 'package:esports_ec/widgets/unfocus_on_tap.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const id = 'CompleteProfileScreen';

  const CompleteProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _data = <String, dynamic>{};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _userCon = UserController.of(context);

    return SafeArea(
      child: Scaffold(
        body: LoadingOverlay(
          screenId: CompleteProfileScreen.id,
          child: UnFocusOnTap(
            child: Form(
              key: _formKey,
              child: OnboardingBackground(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      MyTextField(
                        labelText: 'Enter username',
                        onChanged: (v) => _data['username'] = v,
                        inputType: MyTextInputType.none,
                        validator: (v) {
                          if (Helpers.isNullOrBlank(v)) {
                            return 'Please enter a valid username!';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      MyButton(
                        text: 'Complete Profile',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            startLoading(context, CompleteProfileScreen.id);
                            await _userCon.updateProfile(_data);
                            stopLoading(context);
                            Helpers.showSnackBar(
                              context,
                              text: 'Profile completed successfully!',
                            );
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              BottomNavScreen.id,
                              (route) => false,
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
