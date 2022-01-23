import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget icoLinkAppBar(var _ico, String _url) {
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: false);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(right: 5),
        child: FaIcon(
          _ico,
          color: Colors.blueGrey,
          size: 20.0,
        ),
      ),
    ),
  );
}
