
import 'package:TS_AppsMovil/Services/http-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RegVehicle extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RegVehicle();
}

class _RegVehicle extends State<RegVehicle> {
  final HttpService httpService = HttpService();



  @override
  void initState() {
    super.initState();

  }

  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c0 = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    c1.dispose();
    c2.dispose();
    c0.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar mascota')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: c0,
              decoration: InputDecoration(
                  hintText: 'Nombre'
              ),
            ),

            Container(height: 8),

            TextField(
              controller: c1,
              decoration: InputDecoration(
                  hintText: 'ID de cliente'
              ),
            ),

            Container(height: 8),

            TextField(
              controller: c2,
              decoration: InputDecoration(
                  hintText: 'Raza'
              ),
            ),

            Container(height: 8),


            SizedBox(
                width: double.infinity,
                height: 35,
                child: RaisedButton(
                    child: Text(
                        'Registrar', style: TextStyle(color: Colors.white)),
                    color: Theme
                        .of(context)
                        .primaryColor,
                    onPressed: () async {
                      httpService.createPet( c0.text, int.parse(c1.text), int.parse(c2.text));

                    }
                )
            ),
          ],
        ),
      ),
    );
  }

}
