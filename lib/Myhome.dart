import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  bool oturn = true;
  final displayXO = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int count = 0;

  
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  static var fontdesign = GoogleFonts.lemonada(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
   static var fontdesignn = GoogleFonts.lemonada(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing:1, fontSize:10));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              backgroundColor: Colors.grey.shade900,
              title: Text("XO GAME"),
            ),
            body: Column(
              
              children: <Widget>[
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width:MediaQuery.of(context).size.width * 0.85 ,
                    decoration: BoxDecoration(
                     // color:Colors.black38,
                      gradient: LinearGradient(colors: <Color>[Colors.black54,Colors.black]
                      ,
                    ),
                      border:Border.all(
                        color:Colors.orangeAccent,
                        width:2
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: 10,
  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Player O',
                                style: fontdesign,
                              ),
                              Text(
                                oScore.toString(),
                                style: fontdesign,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Player X',
                                style: fontdesign,
                              ),
                              Text(
                                xScore.toString(),
                                style: fontdesign,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height:20),
                Expanded(
                  flex: 3,
                  // color: Colors.red,
                  
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              tapped(index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.yellow[700])),
                                child: Center(
                                  child: Text(
                                    displayXO[index],
                                    // index.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40),
                                  ),
                                )),
                          );
                        }),
                  ),
              
              ],
            )));
  }
 void tapped(int index) {
    count += 1;
    setState(() {
      if (oturn && displayXO[index] == '') {
        displayXO[index] = "O";
        
      } else if (!oturn && displayXO[index] == '') {
        displayXO[index] = 'X';
      }
      oturn = !oturn;
      checkwinner();
    });
  }

  void checkwinner() {
    // for rows check
     if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      showdialogbox(displayXO[0]);
    }
    //checks 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      showdialogbox(displayXO[3]);
    }
    //checks 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      showdialogbox(displayXO[6]);
    }
    //checks 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      showdialogbox(displayXO[0]);
    }
    //checks 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      showdialogbox(displayXO[1]);
    }
    //checks 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      showdialogbox(displayXO[2]);
    }
    //checks diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      showdialogbox(displayXO[6]);
    }
    //checks diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      showdialogbox(displayXO[0]);
    } 
    if (count == 9) {
       showdrawdialogbox();
    }
  } //checkwinner

  void showdrawdialogbox() {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            
              title: Text("THE MATCH IS DRAW"),
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    RaisedButton(
                        color: Colors.black,
                        onPressed: () {
                           _cleanboard();
                          Navigator.of(context).pop();
                        },
                        child: Text('PLAY AGIAN', style: fontdesign)),
                  ],
                )
              ]);
        });
  }

  void showdialogbox(String winner) {
    
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.black,
              title: Text("WINNER is player:  " + winner),
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    ( RaisedButton(
                        color: Colors.black,
                        onPressed: () {
                          _cleanboard();
                          Navigator.of(context).pop();
                        },
                        child: Text('PLAY AGIAN', style: fontdesignn))
          ),
                  RaisedButton(
                        color: Colors.black,
                        onPressed: () {
                          exit(0);
                        },
                        child: Text('EXIT', style: fontdesignn))
                  ],
                )]);
        });
   
    if (winner == 'O') {
      oScore += 1;
      } 
    else if (winner == 'X') 
    {
      xScore += 1;
    }
    else {
      showdrawdialogbox();
    }

    
  }

  void _cleanboard() {
setState(() {
for (int i=0;i<=8;i++){
  displayXO[i]='';
}
    });
    count=0;

  }


}
