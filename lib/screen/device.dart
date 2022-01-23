///
/// screen/device.dart
///
import 'package:cv/styles/style.dart';
import 'package:cv/widget/widget_icolink_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'skill.dart';
import 'experience.dart';
import 'education.dart';
import 'info.dart';
import 'profil.dart';

/// La classe de l'écran, qui va instancier un état
// ignore: must_be_immutable
class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

/// La classe de l'état
class _DeviceScreenState extends State<DeviceScreen> {
  /// écran par défaut
  int _currentScreen = 0;
  String titre_page = "Baptiste Michel";
  bool titre_centre = true;
  List<Widget>? icoHide = null;
  List<Widget> icoList = <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icoLinkAppBar(
          FontAwesomeIcons.github,
          "https://github.com/baptistemchl",
        ),
        icoLinkAppBar(
          FontAwesomeIcons.linkedin,
          "https://www.linkedin.com/in/baptistemichel1994",
        ),
        icoLinkAppBar(
          FontAwesomeIcons.pager,
          "https://baptistemchl.github.io/",
        )
      ],
    ),
  ];

  /// liste des écrans
  final List<Widget> _screenList = [
    ProfilScreen(),
    ExperienceScreen(),
    EducationScreen(),
    SkillScreen(),
    InfosScreen(),
  ];

  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: titre_centre,
          actions: icoHide,
          title: Text(titre_page),
          shadowColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          titleTextStyle: appBarStyle),
      //
      body: _screenList[_currentScreen],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        //
        onTap: onTabTapped,

        backgroundColor: Colors.lightBlue,
        fixedColor: Colors.blueGrey,
        unselectedItemColor: Colors.white,
        //
        currentIndex: _currentScreen,
        //
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering_outlined),
            label: 'Experiences',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Formations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_outlined),
            label: 'Compétences',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_outlined),
            label: 'Informations',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;

      if (index == 0) {
        titre_page = "Baptiste Michel";
        titre_centre = true;
        icoHide = null;
      } else if (index == 1) {
        titre_page = "Experiences";
        titre_centre = false;
        icoHide = icoList;
      } else if (index == 2) {
        titre_page = "Formations";
        titre_centre = false;
        icoHide = icoList;
      } else if (index == 3) {
        titre_page = "Compétences";
        titre_centre = false;
        icoHide = icoList;
      } else if (index == 4) {
        titre_page = "Informations";
        titre_centre = false;
        icoHide = icoList;
      }
    });
  }
}
