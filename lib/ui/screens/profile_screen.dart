import 'package:flutter/material.dart';
import 'package:hotels_app/ui/widgets/mybottomnavbar.dart';
import 'package:hotels_app/ui/widgets/profile_widget.dart';
import 'package:hotels_app/ui/widgets/textfield_widget.dart';
import 'package:hotels_app/utils/constants.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 19:48.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff2446a6),
        body:  ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: kProfilePic,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: '',
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: '',
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: '',
              maxLines: 5,
              onChanged: (about) {},
            ),
            ElevatedButton(
              onPressed: () {

            },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}