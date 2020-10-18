import 'package:flutter/material.dart';
import 'package:XOGAME/Myhome.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    initialRoute: "/",
           routes: {
      "/":(context)=>Myhome(),
     // "/player":(context)=>PLAYER(),
    },
  ));}