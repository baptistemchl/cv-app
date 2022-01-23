import 'package:cv/service/airtabale_data_profil_http.dart';
import 'package:cv/widget/widget_icolink_profil.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cv/model/airtable_data_profil.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),

      ///
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 30, color: Colors.blueGrey, spreadRadius: 5)
              ],
            ),
            child: const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
                maxRadius: 100,
                backgroundColor: Colors.green,
              ),
            ),
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icoLink(
                FontAwesomeIcons.github,
                "https://github.com/baptistemchl",
              ),
              icoLink(
                FontAwesomeIcons.linkedin,
                "https://www.linkedin.com/in/baptistemichel1994",
              ),
              icoLink(
                FontAwesomeIcons.pager,
                "https://baptistemchl.github.io/",
              )
            ],
          ),

          ///
          ///
          ///
          ///
          Container(
            height: 300,
            child: FutureBuilder(
              future: airtableData.getProfil(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataProfil>? values = snapshot.data;
                  return ListView(
                    children: values!
                        .map(
                          (AirtableDataProfil value) => ListTile(
                            horizontalTitleGap: 2.0,
                            leading: Text(
                              value.icon,
                              style: const TextStyle(
                                  fontFamily: 'MaterialIcons', fontSize: 25),
                            ),
                            title: Text(value.content,
                                style: const TextStyle(fontFamily: 'Arvo')),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
