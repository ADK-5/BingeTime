import 'package:moviesapp/homePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'auth_screens/signIn.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark,primarySwatch: Colors.red),
      home: StreamBuilder(
          stream: Auth().authStateChanges,
          builder: (context,snapshot){
            Auth().authStateChanges.listen((User? user) {
              if(user==null) print("No user");
              else print("User ${user.uid} signed In");
            });
            if(snapshot.hasData){
              return const MyHomePage();
            }
            else{
              return const LoginPage();
            }
          }),
    );
  }
}
