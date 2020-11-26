
import 'package:TS_AppsMovil/Model/Petkeeper.dart';
import 'package:TS_AppsMovil/Services/http-service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class KeeperList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _KeeperList();
}

class _KeeperList extends State<KeeperList> {
  final HttpService httpService = HttpService();
  List<Petkeeper> keepers;

  Future<List<Petkeeper>> getPetkeeper() async {
    this.keepers = await httpService.getKeppers();
    return this.keepers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getPetkeeper(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              //provider.getData(context);
              return Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text('Nombre'),
                          tooltip: ''),
                      DataColumn(
                          label: Text('Apellido'),
                          tooltip: ''),
                      DataColumn(
                          label: Text('Email'),
                          tooltip: ''),
                      DataColumn(
                          label: Text('Cumpleaños'),
                          tooltip: ''),
                    ],
                    rows: this
                        .keepers
                        .map((data) =>
                            // we return a DataRow every time
                            DataRow(
                                // List<DataCell> cells is required in every row
                                cells: [
                                  /*DataCell((data.verified)
                                    ? Icon(
                                        Icons.verified_user,
                                        color: Colors.green,
                                      )
                                    : Icon(Icons.cancel, color: Colors.red)),*/
                                  // I want to display a green color icon when user is verified and red when unverified

                                  DataCell(
                                   Text( data.firstName),
                                  ),
                                  DataCell(Text(data.lastname)),
                                  DataCell(Text(data.email)),
                                  DataCell(Text(data.birthday.toString())),
                                ]))
                        .toList(),
                  ),
                ),
              );
            }
            // when we have the json loaded... let's put the data into a data table widget
          },
        ),
      ),
    );
  }
}
