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

  void tapped(int index) {
    setState(() {
      if (oturn && displayXO[index] == '') {
        displayXO[index] = 'O';
        count += 1;
      } else if (!oturn && displayXO[index] == '') {
        displayXO[index] = 'X';
        count += 1;
      }
      oturn = !oturn;
      checkwinner();
    });
  }

  void checkwinner() {
    // for rows check
  
    for (int i = 0; i <= 8; i += 3) {
      if (displayXO[i] == displayXO[i + 1] &&
          displayXO[i] == displayXO[i + 2] &&
          displayXO[i] != '') {
        print("win");
        showdialogbox(displayXO[i]);
      }
    }
    //for column check
    for (int i = 0; i <= 2; i++) {
      if (displayXO[i] == displayXO[i + 3] &&
          displayXO[i] == displayXO[i + 6] &&
          displayXO[i] != '') {
        print("win");
        showdialogbox(displayXO[i]);
      }
    }
    //for diaogoanl check
    for (int i = 0; i <= 2; i += 2) {
      if (displayXO[0] == displayXO[4] &&
          displayXO[0] == displayXO[8] &&
          displayXO[0] != '') {
        print("win");
        showdialogbox(displayXO[i]);
      }
      else if( (displayXO[2] == displayXO[4] &&
          displayXO[2] == displayXO[6] &&
          displayXO[0] != '')){
            print("win");
        showdialogbox(displayXO[i]);
          }
    }

    if (count == 9) {
      showdrawdialogbox();
      print(count);
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
                RaisedButton(
                    color: Colors.black,
                    onPressed: () {
                       cleanboard();
                      Navigator.of(context).pop();
                    },
                    child: Text('PLAY AGIAN', style: fontdesign))
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
                ( RaisedButton(
                    color: Colors.black,
                    onPressed: () {
                      cleanboard();
                      Navigator.of(context).pop();
                    },
                    child: Text('PLAY AGIAN', style: fontdesign))
          )]);
        });
    if (winner == 'O') {
      oScore += 1;
      } 
    else if (winner == 'X') 
    {
      xScore += 1;
    }

    
  }

  void cleanboard() {
    setState(() {
for (int i=0;i<9;i++){
  displayXO[i]='';
}
    });

  }
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  static var fontdesign = GoogleFonts.lemonada(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              backgroundColor: Colors.grey.shade700,
              title: Text("XO GAME"),
            ),
            body: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
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
                          padding: const EdgeInsets.all(20.0),
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
                Expanded(
                  flex: 3,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                                        Border.all(color: Colors.grey[700])),
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
                ),
              ],
            )));
  }
}
