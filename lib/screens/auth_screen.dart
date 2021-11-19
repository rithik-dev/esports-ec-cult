import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/controllers/user_controller.dart';
import 'package:esports_ec/models/user.dart';
import 'package:esports_ec/screens/bottom_nav_screen.dart';
import 'package:esports_ec/screens/complete_profile_screen.dart';
import 'package:esports_ec/services/auth_service.dart';
import 'package:esports_ec/utils/helpers.dart';
import 'package:esports_ec/widgets/loading_overlay.dart';
import 'package:esports_ec/widgets/my_button.dart';
import 'package:esports_ec/widgets/my_text_field.dart';
import 'package:esports_ec/widgets/onboarding_background.dart';
import 'package:esports_ec/widgets/unfocus_on_tap.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const id = 'AuthScreen';

  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _data = <String, dynamic>{};

  bool _isLogin = true;

  void onLogin(BuildContext context) async {
    User? _profile;

    if (_isLogin) {
      _profile = await UserController.of(
        context,
        listen: false,
      ).initializeUser();
    }

    late String screenId;
    if (_profile == null) {
      screenId = CompleteProfileScreen.id;
    } else {
      screenId = BottomNavScreen.id;
    }
    Navigator.pushNamedAndRemoveUntil(
      context,
      screenId,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoadingOverlay(
        screenId: AuthScreen.id,
        child: Scaffold(
          body: UnFocusOnTap(
            child: Form(
                key: _formKey,
                child: OnboardingBackground(
                  children: [
                    ListView(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Text(
                          _isLogin ? 'Welcome!' : 'New Here?',
                          style: const TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25),
                        MyTextField(
                          labelText: 'Enter email',
                          onChanged: (v) => _data['email'] = v,
                          inputType: MyTextInputType.email,
                          validator: (v) {
                            if (Helpers.isNullOrBlank(v) || !v!.contains('@')) {
                              return 'Please enter a valid email address!';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          labelText: 'Enter password',
                          inputType: MyTextInputType.none,
                          onChanged: (v) => _data['password'] = v,
                          validator: (v) {
                            if (Helpers.isNullOrBlank(v)) {
                              return 'Please enter a valid password!';
                            } else if (v!.length < 6) {
                              return 'The password should be at least 6 digits long';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        MyButton(
                          text: _isLogin ? 'Login' : 'Register',
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              startLoading(context, AuthScreen.id);
                              String? uid;

                              try {
                                if (_isLogin) {
                                  uid =
                                      await AuthService.loginUsingEmailPassword(
                                    email: _data['email'],
                                    password: _data['password'],
                                  );
                                } else {
                                  uid = await AuthService
                                      .registerUsingEmailPassword(
                                    email: _data['email'],
                                    password: _data['password'],
                                  );
                                }
                              } on firebase_auth
                                  .FirebaseAuthException catch (e) {
                                Helpers.showSnackBar(
                                  context,
                                  text: e.message ?? 'Something went wrong!',
                                );
                              }
                              if (uid != null) onLogin(context);
                              stopLoading(context);
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: EasyContainer(
                            onTap: () async {
                              startLoading(context, AuthScreen.id);
                              final uid = await AuthService.authWithGoogle();
                              if (uid != null) onLogin(context);
                              stopLoading(context);
                            },
                            color: Theme.of(context).cardColor,
                            alignment: null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/icons/google.png'),
                                const SizedBox(width: 10),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: InkWell(
            onTap: () => setState(() => _isLogin = !_isLogin),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                _isLogin
                    ? 'Don\'t have an account? Sign up'
                    : 'Already have an account? Sign in',
                style: TextStyle(color: Colors.grey[200], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
