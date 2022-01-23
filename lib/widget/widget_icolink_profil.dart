import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget icoLink(var _ico, String _url) {
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: false);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey.shade600,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),

        padding: const EdgeInsets.all(8),

        // Change button text when light changes state.
        child: FaIcon(
          _ico,
          color: Colors.black,
          size: 25.0,
        ),
      ),
    ),
  );
}
