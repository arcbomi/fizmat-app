import 'package:fizmat_app/screens/book/book.dart';
import 'package:fizmat_app/screens/formula/formula.dart';
import 'package:fizmat_app/screens/home/local_widgets/grid_view.dart';
import 'package:fizmat_app/screens/kundelik/kundelik_login.dart';
import 'package:fizmat_app/widgets/fiz_headtext.dart';
import 'package:flutter/material.dart';

class FizHome extends StatelessWidget {
  const FizHome({super.key});

  @override
  Widget build(BuildContext context) {
    //我好像记得在这里ScrollView和GridView有冲突
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          FizHeadText(
            top: 50,
            text: "Home",
            fontSize: 50,
          ),
          FizHomeGridView(
            containerInfoList: [
              FizHomeContainerInfo(
                pages: FizBookOnline(),
                title: 'Book',
                color: Color.fromARGB(255, 26, 35, 126),
              ),
              FizHomeContainerInfo(
                pages: FizFormula(),
                title: 'Formula',
                color: Color.fromARGB(255, 56, 142, 60),
              ),
              FizHomeContainerInfo(
                pages: FizKunLogin(),
                title: 'Kundelik',
                color: Color.fromARGB(255, 251, 140, 0),
              ),
              FizHomeContainerInfo(
                pages: Container(),
                title: 'Volunteer',
                color: Color.fromARGB(255, 142, 36, 170),
              ),
              FizHomeContainerInfo(
                pages: Container(),
                title: 'Ranking',
                color: Color.fromARGB(255, 211, 47, 47),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
