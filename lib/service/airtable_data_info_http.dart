import 'dart:convert';

import 'package:cv/model/airtable_data_info.dart';
import 'package:http/http.dart' as http;

import 'package:cv/utils/config.dart';

class AirtableDataInfoHttp {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/info",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataInfo>> getInfo() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.airtableApikey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataInfo> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataInfo(
              id: value['id'],
              title: value['fields']['title'],
              text: value['fields']['text'],
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
