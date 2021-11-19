import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/controllers/user_controller.dart';
import 'package:esports_ec/screens/arena_screen.dart';
import 'package:esports_ec/screens/home_screen.dart';
import 'package:esports_ec/screens/profile_screen.dart';
import 'package:esports_ec/widgets/custom_back_button.dart';
import 'package:esports_ec/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  static const id = 'BottomNavScreen';

  const BottomNavScreen({
    Key? key,
  }) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static const _navBarTiles = ['Home', 'Arena', 'Profile'];

  @override
  Widget build(BuildContext context) {
    final user = UserController.of(context).user;

    return SafeArea(
      child: LoadingOverlay(
        screenId: BottomNavScreen.id,
        child: Scaffold(
          appBar: _selectedIndex == 2
              ? AppBar(
                  leading: const CustomBackButton(),
                  title: const Text(
                    'Account Overview',
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(75),
                  child: EasyContainer(
                    width: double.infinity,
                    margin: 0,
                    customBorderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    alignment: null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ${user?.name ?? ''}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Let\'s learn something...',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
          body: IndexedStack(
            index: _selectedIndex,
            children: const [
              HomeScreen(),
              ArenaScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).cardColor,
            child: SizedBox(
              height: 75,
              child: Row(
                children: List.generate(_navBarTiles.length, (index) {
                  final title = _navBarTiles[index];
                  return Expanded(
                    child: Center(
                      child: EasyContainer(
                        borderRadius: 20,
                        customPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        alignment: null,
                        onTap: () => setState(() => _selectedIndex = index),
                        color: _selectedIndex == index
                            ? Colors.white.withOpacity(0.5)
                            : Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/${title.toLowerCase()}.png',
                              color: Colors.white,
                            ),
                            const SizedBox(height: 5),
                            Text(title),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
