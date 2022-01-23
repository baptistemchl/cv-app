import 'package:cv/model/airtable_data_info.dart';
import 'package:cv/service/airtable_data_info_http.dart';
import 'package:cv/widget/widget_imagestack_info.dart';

import 'package:flutter/material.dart';

class InfosScreen extends StatefulWidget {
  const InfosScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfosScreen> {
  final AirtableDataInfoHttp airtableData = AirtableDataInfoHttp();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FutureBuilder(
      future: airtableData.getInfo(),
      builder: (BuildContext context,
          AsyncSnapshot<List<AirtableDataInfo>> snapshot) {
        if (snapshot.hasData) {
          List<AirtableDataInfo>? values = snapshot.data;
          return ListView(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            children: values!
                .map(
                  (AirtableDataInfo value) => ListTile(
                    title: Stack(
                      children: <Widget>[
                        imageStack(value.image, value.title, value.text),
                      ],
                    ),
                    // subtitle: Text(value.text),
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
