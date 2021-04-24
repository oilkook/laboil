import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laboil/view/home.dart';
import 'package:laboil/view/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFFFFFFF),
              Colors.pink,
            ])),
        child: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('ERROR'),
                ),
              );
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return Login();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return Scaffold(
              body: Center(
                child: Text('LOAD'),
              ),
            );
          },
        ),
      ),
    );
  }
}
