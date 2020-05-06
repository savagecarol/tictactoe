import 'package:flutter/material.dart';
import 'dart:math';
class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool ohturn = true;
    List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
    int ohScore = 0;
    int exScore = 0;
    int filledboxes = 0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.grey[800],
            body: Column(
                children: <Widget>[
                    Expanded(
                        child: Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.only(top:45.0,bottom:20 ,right:30 ,left:30),
                                        child: Column(
                                            children: <Widget>[
                                                Text(
                                                    'Player O',
                                                    style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white,fontSize: 30),
                                                ),
                                                Text(
                                                    ohScore.toString(),
                                                    style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white,fontSize: 30)
                                                ),
                                            ],
                                        ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top:45.0,bottom:20 ,right:30 ,left:30),
                                        child: Column(
                                            children: <Widget>[
                                                Text(
                                                    'Player X',
                                                    style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white,fontSize: 30)
                                                ),
                                                Text(
                                                    exScore.toString(),
                                                    style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white,fontSize: 30)
                                                ),
                                            ],
                                        ),
                                    )
                                ],
                            ),
                        ),
                    ),
                    Expanded(
                        flex: 3,
                        child: GridView.builder(
                            itemCount: 9,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                        _tapped(index);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey[800],width: 2.5),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[600],
                                                    offset: Offset.fromDirection(.25 * pi, 10),
                                                    blurRadius: 20)
                                                ,
                                            ]),

                                        child: Center(
                                            child: Text(
                                                displayExOh[index],
                                                style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white,fontSize: 40),
                                            ))),
                                );
                            }),
                    ),
                    Expanded(
                        child:new Container(
                            padding:const EdgeInsets.only(top:50.0,right:20,left: 20,bottom: 20) ,
                            child:new Column(
                                children:<Widget>[
                                    Text("Tic Tac Toe",style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white)),
                                    Padding(padding: EdgeInsets.only(top: 40)),
                                    Text("@CreatedByKartikeya",style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic , color:Colors.white)),
                                ]
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

    void _tapped(int index) {
        setState(() {
            if (ohturn && displayExOh[index] == '') {
                displayExOh[index] = 'o';
                filledboxes += 1;
            } else if (!ohturn && displayExOh[index] == '') {
                displayExOh[index] = 'x';
                filledboxes += 1;
            }
            ohturn = !ohturn;
            _checkWinner();
        });
    }

    void _checkWinner() {
        if (displayExOh[0] == displayExOh[1] &&
            displayExOh[0] == displayExOh[2] &&
            displayExOh[0] != '') {
            _showWinDialog(displayExOh[0]);
        }
        if (displayExOh[3] == displayExOh[4] &&
            displayExOh[3] == displayExOh[5] &&
            displayExOh[3] != '') {
            _showWinDialog(displayExOh[3]);
        }
        if (displayExOh[6] == displayExOh[7] &&
            displayExOh[6] == displayExOh[8] &&
            displayExOh[6] != '') {
            _showWinDialog(displayExOh[6]);
        }
        if (displayExOh[0] == displayExOh[3] &&
            displayExOh[0] == displayExOh[6] &&
            displayExOh[0] != '') {
            _showWinDialog(displayExOh[0]);
        }
        if (displayExOh[1] == displayExOh[4] &&
            displayExOh[1] == displayExOh[7] &&
            displayExOh[1] != '') {
            _showWinDialog(displayExOh[1]);
        }
        if (displayExOh[2] == displayExOh[5] &&
            displayExOh[2] == displayExOh[8] &&
            displayExOh[2] != '') {
            _showWinDialog(displayExOh[2]);
        }
        if (displayExOh[0] == displayExOh[4] &&
            displayExOh[0] == displayExOh[8] &&
            displayExOh[0] != '') {
            _showWinDialog(displayExOh[0]);
        }
        if (displayExOh[2] == displayExOh[4] &&
            displayExOh[2] == displayExOh[6] &&
            displayExOh[2] != '') {
            _showWinDialog(displayExOh[2]);
        } else if (filledboxes == 9) {
            _showDrawDialog();
        }
    }

    void _showWinDialog(String winner) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: Colors.lightBlueAccent,
                    title: Text("Winner is " + winner.toUpperCase(),style:TextStyle(fontStyle: FontStyle.italic)),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('Play Again!',style:TextStyle(fontStyle: FontStyle.italic)),color: Colors.black,
                            onPressed: () {
                                _clearBoard();
                                Navigator.of(context).pop();
                            },
                        )
                    ],
                );
            });
        if (winner == 'o') {
            ohScore = ohScore + 1;
        } else {
            exScore = exScore + 1;
        }
        filledboxes=0;

    }

    void _clearBoard() {
        setState(() {
            for (int i = 0; i < 9; i++) {
                displayExOh[i] = "";
            }
        });
    }

    void _showDrawDialog()
    {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: Colors.lightBlueAccent,
                    title: Text(" Draw ",style:TextStyle(fontStyle: FontStyle.italic)),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('Play Again!',style:TextStyle(fontStyle: FontStyle.italic)),color: Colors.black,
                            onPressed: () {
                                _clearBoard();
                                Navigator.of(context).pop();
                            },
                        )
                    ],
                );
            });
        filledboxes=0;

    }
}
