// ignore_for_file: file_names

import 'package:cv/styles/style.dart';
import 'package:flutter/material.dart';

Stack imageStack(source, legend, speech) {
  return Stack(
    children: <Widget>[
      Container(
        height: 250,
        width: double.infinity,
        //
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(source),
              fit: BoxFit.fitHeight,
            )),
      ),
      Positioned(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                legend,
                style: xpSubTitleStyle,
              ),
            )),
      ),
      Positioned(
        bottom: 20.0,
        left: 20.0,
        right: 10.0,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(speech, style: xpNotesStyle),
            )),
      ),
    ],
  );
}
