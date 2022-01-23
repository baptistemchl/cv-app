import 'package:cv/service/airtable_data_experience_http.dart';
import 'package:cv/styles/style.dart';
import 'package:flutter/material.dart';

import 'package:cv/model/airtable_data_experience.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final AirtableDataExperienceHttp airtableData = AirtableDataExperienceHttp();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FutureBuilder(
      future: airtableData.getExperience(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataExperience>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataExperience>? values = snapshot.data;
          return ListView(
            padding: const EdgeInsets.only(top: 10.0),
            children: values!
                .map(
                  (AirtableDataExperience value) => ListTile(
                    leading: Image.network(value.logo),
                    title: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        value.title,
                        style: xpTitleStyle,
                      ),
                    ),
                    // trailing: Text(value.date, style: xpDateStyle),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(value.fonction, style: xpSubTitleStyle),
                        Text(value.date, style: xpDateStyle),
                        const Padding(padding: EdgeInsets.all(7.0)),
                        Text(value.notes, style: xpNotesStyle),
                      ],
                    ),
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
