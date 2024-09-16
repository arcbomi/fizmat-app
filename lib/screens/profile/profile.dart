// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:fizmat_app/models/student.dart';
import 'package:fizmat_app/screens/profile/local_widgets/avatar.dart';
import 'package:fizmat_app/screens/profile/local_widgets/button.dart';
import 'package:fizmat_app/screens/profile/local_widgets/number_stuff.dart';
import 'package:fizmat_app/screens/profile/local_widgets/showing_text.dart';
import 'package:fizmat_app/widgets/fiz_headtext.dart';
import 'package:flutter/material.dart';

class FizProfile extends StatelessWidget {
  const FizProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final student = FizStudentInfo.getCurrentStudent;
    return Scaffold(
        body: Stack(children: [
      FizHeadText(
        top: 50,
        text: "Profile",
        fontSize: 50,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            FizAvatar(
              imagePath: student.imagePath,
              onClicked: () {},
            ),
            SizedBox(height: 20),
            FizProfileName(
              name: student.name,
              email: student.email,
            ),
            SizedBox(height: 20),
            FizProfileNumbersStuff(
              children: [
                FizProfileNumbersStuff.buildButton(context, student.ranking.toString(), 'Ranking'),
                FizProfileNumbersStuff.buildButton(context, student.volHours.toString(), 'Volunteering Hours'),
                FizProfileNumbersStuff.buildButton(context, student.appGPA.toString(), 'Approx. GPA'),
              ],
            ),
            SizedBox(height: 60),
            FizLogoutButton(
              text: "Logout from kundelik",
              onClicked: () {},
              icon: Icons.exit_to_app,
            ),
            SizedBox(height: 20),
            FizLogoutButton(
              text: "Logout from app",
              onClicked: () {Navigator.pushNamed(context, "/");},
              icon: Icons.exit_to_app,
            ),
          ],
        ),
      ),
    ]));
  }
}
