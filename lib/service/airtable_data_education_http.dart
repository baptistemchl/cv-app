import 'dart:convert';

import 'package:cv/model/airtable_data_education.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataEducationHttp {
  final Uri urlEducation = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/education",
    {"maxRecords": "500", "view": "Grid view"},
  );

  Future<List<AirtableDataEducation>> getEducation() async {
    final res = await http.get(
      urlEducation,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataEducation> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataEducation(
              id: value['id'],
              title: value['fields']['title'],
              detail: value['fields']['detail'],
              image: value['fields']['image'][0]['url'],
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
