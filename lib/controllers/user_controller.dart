import 'package:esports_ec/models/user.dart';
import 'package:esports_ec/repositories/user_repository.dart';
import 'package:esports_ec/services/auth_service.dart';
import 'package:flutter/cupertino.dart' show BuildContext, ChangeNotifier;
import 'package:provider/provider.dart';

class UserController extends ChangeNotifier {
  static UserController of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<UserController>(context, listen: listen);

  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  Future<User?> _update([User? newUser]) async {
    newUser ??= await initializeUser();
    _user = newUser;
    notifyListeners();
    return _user;
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {}

  Future<User?> register({
    required String email,
    required String password,
  }) async {
    // final _registeredUser = await Future.delayed(Duration(seconds: 1)) as User?;
    // if (_registeredUser != null) return await _update(_registeredUser);
  }

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    // final _loggedInUser = await Future.delayed(Duration(seconds: 1)) as User?;
    // if (_loggedInUser != null) return await _update(_loggedInUser);
  }

  Future<User?> initializeUser() async {
    final _currentUser = await UserRepository.getUserProfile();
    if (_currentUser != null) return await _update(_currentUser);
  }

  Future<void> logout() async {
    await AuthService.signOut();
    clear();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
