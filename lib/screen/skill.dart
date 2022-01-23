import 'package:cv/service/airtable_data_skill_http.dart';
import 'package:cv/styles/style.dart';
import 'package:flutter/material.dart';

import 'package:cv/model/airtable_data_skill.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  final AirtableDataSkillHttp airtableData = AirtableDataSkillHttp();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FutureBuilder(
      future: airtableData.getSkill(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataSkill>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataSkill>? values = snapshot.data;
          return ListView(
            children: values!
                .map((AirtableDataSkill value) => ListTile(
                    title: Text(value.category, style: xpTitleStyle),
                    subtitle: Wrap(children: [
                      for (var imageSkill in value.skills)
                        Container(
                          child: Image.network(imageSkill),
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    ])))
                .toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
