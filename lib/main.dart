import 'package:flutter/material.dart';
import 'package:XOGAME/Myhome.dart';
import 'package:XOGAME/1stpage.dart';


void main() {
  runApp(new MyApp());
}
 
class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  
  Widget build(BuildContext context) {
    return new MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    initialRoute: "/",
           routes: {
      "/":(context)=>Stpage(),
      "/home":(context)=>Myhome()
     // "/player":(context)=>PLAYER(),
           });
  }}