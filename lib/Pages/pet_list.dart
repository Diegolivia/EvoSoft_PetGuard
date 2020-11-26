
import 'package:TS_AppsMovil/Model/Pet.dart';

import 'package:TS_AppsMovil/Pages/create_pet_screen.dart';
import 'package:TS_AppsMovil/Pages/update_pet_screen.dart';
import 'package:TS_AppsMovil/Services/http-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class PetView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PetView();
}

class _PetView extends State<PetView> {
  final HttpService httpService = HttpService();

  List<Pet> pets;
  Future<Pet> _future ;

 @override
 void initState() {
   super.initState();
   _future ;
 }

  Future<List<Pet>> getPet() async {
    this.pets = await httpService.getPets();
    return this.pets;
  }



  Widget createSubsListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;


    return ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            child: Container(
              height:120.0,
              child: Row(
                children: <Widget>[

                  Container(
                    height: 120,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ListTile(
                            title: Text('Nombre :' + values[index].name, style:TextStyle(color:Colors.black, fontSize: 16.0, )),
                           subtitle: Text('Raza: ' + values[index].breed.toString(), style:TextStyle(color:Colors.grey, fontSize: 14.0, )),
                           onTap: (){

                            },),
                          Row(
                            children: <Widget>[
                              Icon(Icons.pets_sharp, color: Colors.grey),
                              Text("  ID: " + values[index].id.toString(), style:TextStyle(color:Colors.cyan, fontSize: 14.0)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  //-------------------------
                  Container(
                    height: 150,
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: Text('Eliminar', style:TextStyle(color:Colors.white, fontSize: 14.0)),
                                color: Colors.redAccent,
                                onPressed: () {
                                  setState(() {
                                    debugPrint(values[index].id.toString());
                                    _future = httpService.deletePet(values[index].id.toString());
                                  });
                                },
                              ),
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: Text('Actualizar', style:TextStyle(color:Colors.white, fontSize: 14.0)),
                                color: Colors.blue,
                                onPressed: () {
                                  setState(() {//debugPrint(values[index].id.toString());

                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => UpdatePet(id : values[index].id)));



                                  });
                                },
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
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
      appBar: AppBar(
        title: Text('Mascotas'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add',
              //onPressed: scaffoldKey.currentState.showSnachBar(snackBar);
              onPressed: () {

                 Navigator.push(context,
                 MaterialPageRoute(
                 builder: (BuildContext context) => RegVehicle()));

              })
        ],
      ),

      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: getPet(),
              initialData: [],
              builder: (context, snapshot) {
                return createSubsListView(context, snapshot);
              }),
        ),
      ]),
    );
  }
}


