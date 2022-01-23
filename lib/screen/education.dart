import 'package:cv/service/airtable_data_education_http.dart';
import 'package:cv/styles/style.dart';
import 'package:flutter/material.dart';

import 'package:cv/model/airtable_data_education.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final AirtableDataEducationHttp airtableData = AirtableDataEducationHttp();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FutureBuilder(
      future: airtableData.getEducation(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataEducation>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataEducation>? values = snapshot.data;
          return ListView(
            padding: const EdgeInsets.only(top: 10.0),
            children: values!
                .map(
                  (AirtableDataEducation value) => ListTile(
                    leading: Image.network(value.image),
                    title: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        value.title,
                        style: xpTitleStyle,
                      ),
                    ),
                    subtitle: Text(value.detail, style: xpNotesStyle),
                  ),
                )
                .toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
