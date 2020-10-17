import 'package:flutter/material.dart';
import 'package:XOGAME/Myhome.dart';
void main() {
  var materialApp = MaterialApp(
      theme:ThemeData.dark(),
      initialRoute: "/",
             routes: {
        "/":(context)=>Myhome(),
             }
    );
    runApp(materialApp);
  
}