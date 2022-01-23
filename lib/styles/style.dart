import 'package:flutter/material.dart';

const appBarStyle = TextStyle(
  fontFamily: 'Arvo',
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  letterSpacing: 1,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

const xpTitleStyle = TextStyle(
  fontFamily: 'Arvo',
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const xpSubTitleStyle = TextStyle(
    fontFamily: 'Arvo',
    fontSize: 14,
    fontStyle: FontStyle.italic,
    color: Colors.blueGrey);

const xpNotesStyle =
    TextStyle(fontFamily: 'Arvo', fontSize: 14, color: Colors.black87);

const xpDateStyle = TextStyle(
    fontFamily: 'Arvo',
    fontSize: 14,
    fontStyle: FontStyle.italic,
    color: Colors.blueGrey);
