import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/screens/my_courses_screen.dart';
import 'package:esports_ec/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const id = 'ProfileScreen';

  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Column(
          children: const [
            MyCachedNetworkImage(
              url: '',
              width: 150,
              height: 150,
              padding: 10,
            ),
            SizedBox(height: 10),
            Text(
              'User_Name007',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
          ],
        ),
        _infoTile(
          icon: 'edit_profile',
          title: 'Edit Profile',
          onTap: () {},
        ),
        _infoTile(
          icon: 'my_courses',
          title: 'My Courses',
          onTap: () => Navigator.pushNamed(context, MyCoursesScreen.id),
        ),
        const Divider(
          color: Colors.white,
          indent: 50,
          endIndent: 50,
          thickness: 1,
        ),
        _infoTile(
          icon: 'app_version',
          title: 'App Version v0.0.1',
        ),
        _infoTile(
          icon: 'contact_us',
          title: 'Contact Us',
          onTap: () {},
        ),
        _infoTile(
          icon: 'privacy_policy',
          title: 'Privacy Policy',
          onTap: () {},
        ),
        _infoTile(
          icon: 'about_us',
          title: 'About Us',
          onTap: () {},
        ),
        const SizedBox(height: 10),
        Center(
          child: EasyContainer(
            color: Colors.red,
            alignment: null,
            customPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.logout),
                SizedBox(width: 15),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _infoTile({
    required String icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(10),
      leading: Material(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1F223E),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/icons/$icon.png',
            height: 30,
            width: 30,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
