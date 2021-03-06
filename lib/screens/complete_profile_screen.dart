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
  final _data = <String, dynamic>{
    'age': 18.0,
  };
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
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      MyTextField(
                        labelText: 'Enter name',
                        onChanged: (v) => _data['name'] = v,
                        inputType: MyTextInputType.none,
                        validator: (v) {
                          if (Helpers.isNullOrBlank(v)) {
                            return 'Please enter a valid name!';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
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
                      Row(
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(fontSize: 22),
                          ),
                          Expanded(
                            child: Slider(
                              value: _data['age'].toDouble(),
                              onChanged: (age) =>
                                  setState(() => _data['age'] = age),
                              min: 5,
                              max: 80,
                            ),
                          ),
                          Text(
                            _data['age'].toStringAsFixed(0),
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      MyButton(
                        text: 'Complete Profile',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            startLoading(context, CompleteProfileScreen.id);
                            _data['age'] = _data['age'].toInt();
                            await _userCon.createProfile(_data);
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
