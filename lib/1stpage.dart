import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stpage extends StatelessWidget {
  static var fontdesign = GoogleFonts.lemonada(
      textStyle:
          TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 18));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: Container(
        color: Colors.grey[500],
        child:Column(
          children:<Widget>[
           SizedBox(
              height:40
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                child: Image.asset('images/img.png') 
                ),
            )
              
            ,
            SizedBox(
              height:40
            ),
            RaisedButton(
              //color: Colors.lightBlue,
              child: Text('PLAY GAME', style:fontdesign),
              onPressed:(){
                 Navigator.pushNamed(context,"/home");

              })  
              ])
      ),
      
    );
  }
}