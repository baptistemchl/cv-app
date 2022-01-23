import 'dart:convert';

import 'package:cv/model/airtable_data_experience.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataExperienceHttp {
  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/experience",
    {"maxRecords": "5000", "view": "Grid view"},
  );

  Future<List<AirtableDataExperience>> getExperience() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    // print(res.body);

    if (res.statusCode == 200) {
      print('AVANT JSON ');
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataExperience> values = [];
      data.forEach(
        (value) => {
          print(value['fields']['logo'][0]['url']),
          values.add(
            AirtableDataExperience(
              id: value['id'],
              title: value['fields']['title'],
              fonction: value['fields']['fonction'],
              date: value['fields']['date'],
              notes: value['fields']['notes'],
              logo: value['fields']['logo'][0]['url'],
            ),
          )
        },
      );
      return values;
    } else {
      print('EEREUR');
      throw "ERROR !!!!!";
    }
  }
}
