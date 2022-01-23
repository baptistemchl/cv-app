import 'dart:convert';

import 'package:cv/model/airtable_data_skill.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataSkillHttp {
  final Uri urlSkill = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/skill",
    {"maxRecords": "500", "view": "Grid view"},
  );

  Future<List<AirtableDataSkill>> getSkill() async {
    final res = await http.get(
      urlSkill,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    // print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      // print(data);

      List<AirtableDataSkill> values = [];
      data.forEach(
        (value) {
          dynamic skills = value['fields']['skills'];
          List<String> imageList = [];
          skills.forEach((skill) => imageList.add(skill['url']));
          return values.add(
            AirtableDataSkill(
              id: value['id'],
              category: value['fields']['category'],
              skills: imageList,
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
