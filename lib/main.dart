import 'package:TS_AppsMovil/Pages/dashboard.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


void main() async {
  runApp(App());

}

class App extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        body: Dashboard(),
      ),
    );
  }

  }

