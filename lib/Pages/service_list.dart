

import 'package:TS_AppsMovil/Model/Service.dart';
import 'package:TS_AppsMovil/Services/http-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ServiceView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ServiceView();
}

class _ServiceView extends State<ServiceView> {
  final HttpService httpService = HttpService();

  List<Service> services;
  Future<Service> _future ;

  @override
  void initState() {
    super.initState();
    _future ;//= httpService.fetchSub(1.toString());
  }

  Future<List<Service>> getService() async {
    this.services = await httpService.getServices();
    return this.services;
  }



  Widget createSubsListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;


    return ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[

                  Container(
                    height: 120,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ListTile(
                            title: Text(values[index].name, style: TextStyle(
                              color: Colors.black, fontSize: 16.0,)),
                            subtitle: Text(
                                'Descripción:' + values[index].description + '\nFecha: '+ values[index].startTime.toString(),
                                style: TextStyle(
                                  color: Colors.grey, fontSize: 14.0,)),
                            onTap: () {

                            },),
                          Row(
                            children: <Widget>[
                              Icon(
                                  Icons.person, color: Colors.grey),
                              Text("  PetKeeper: " + values[index].petKeeper.firstName + ' ' + values[index].petKeeper.lastname,
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 14.0)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  //-------------------------


                ],
              ),
            ),
          );
        }
        );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: getService(),
              initialData: [],
              builder: (context, snapshot) {
                return createSubsListView(context, snapshot);
              }),
        ),
      ]),
    );
  }
}


