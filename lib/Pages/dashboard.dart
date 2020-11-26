
import 'package:TS_AppsMovil/Pages/profile_screen.dart';

import 'package:TS_AppsMovil/Pages/service_list.dart';

import 'package:TS_AppsMovil/Pages/pet_list.dart';



import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'keeper_list.dart';
import 'payment_list.dart';

class Dashboard extends StatefulWidget {




  @override
  State<StatefulWidget> createState() => _DashBoard();
}

class _DashBoard extends State<Dashboard> {
  String firstName = "";
  String lastName = "";
  String profileURL;
  int _currentPage = 0;
  SharedPreferences sharedPreferences;



  bool gateA = false;

  @override
  void initState() {
    super.initState();

    profileURL = null;

  }

  final List<Widget> _navPages = [
    ServiceView(),
    KeeperList(),
    PaymentList(),

    PetView(),
  ];

  checkLoginStatus(String email, String password) async {
    sharedPreferences = await SharedPreferences.getInstance();


    gateA = true;
    callSetState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void callSetState() {
    setState(
        () {}); // it can be called without parameters. It will redraw based on changes done in _SecondWidgetState
  }

  //================================================

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: Text('Pet Guard'),
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    tooltip: 'Log out',
                    //onPressed: scaffoldKey.currentState.showSnachBar(snackBar);
                    onPressed: () {
                      //sharedPreferences.clear();

                    })
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 220,
                    child: DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: false,
                        children: <Widget>[
                          Container(
                            child: profileURL == null
                                ? CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: NetworkImage(
                                        "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                                        scale: 0.3),
                                  )
                                : CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage:
                                        NetworkImage(profileURL, scale: 0.3),
                                  ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            firstName + " " + lastName,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://static.vecteezy.com/system/resources/previews/000/581/217/non_2x/abstract-dark-blue-background-with-halftone-pattern-light-blue-texture-creative-cover-design-template-vector.jpg'),
                        fit: BoxFit.fill,
                      )),
                    ),
                  ),
                  CustomDrawTile(Icon(Icons.dashboard), Text('Dashboard'),
                      Icon(Icons.arrow_right), ProfileScreen()),
                  CustomDrawTile(Icon(Icons.person), Text('Perfil'),
                      Icon(Icons.arrow_right), ProfileScreen()),
                  CustomDrawTile(
                      Icon(Icons.credit_card),
                      Text('Comprar créditos'),
                      Icon(Icons.arrow_right),
                      ProfileScreen()),
                  CustomDrawTile(
                      Icon(Icons.settings),
                      Text('Configuración de la cuenta'),
                      Icon(Icons.arrow_right),
                      ProfileScreen()),

                  CustomDrawTile(
                      Icon(Icons.pets),
                      Text('Mascotas'),
                      Icon(Icons.arrow_right),
                      PetView()),
                ],
              ),
            ),
            body: _navPages[_currentPage],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  title: Text('Servicios'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_rounded),
                  title: Text('Pet Keepers'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money_sharp),
                  title: Text('Pagos'),
                )
              ],
              currentIndex: _currentPage,
              selectedItemColor: Colors.lightBlue[800],
              onTap: _onItemTapped,
            )),
        /*Container(
          child: gateA == false
              ? Container(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : null,
        )*/
      ],
    ));
  }
}

// ignore: must_be_immutable
class CustomDrawTile extends StatelessWidget {
  Icon icon1, icon2;
  Text title;
  StatefulWidget page;
  CustomDrawTile(icon1, title, icon2, page) {
    this.icon1 = icon1;
    this.icon2 = icon2;
    this.title = title;
    this.page = page;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.lightBlue[200],
      child: Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  icon1,
                  Text('  '),
                  title,
                ],
              ),
              icon2,
            ],
          )),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ))
      },
    );
  }
}
