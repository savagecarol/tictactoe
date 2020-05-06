
import 'package:flutter/cupertino.dart';

import 'homepage.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}
class Page extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _Pg();

}

class _Pg extends State<Page>
{
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body:new Container(
                 color: Colors.black,
                padding: const EdgeInsets.only(top:80,bottom:20 ,right:40 ,left:40),
                child:Column(
                  children: <Widget>[
                      Padding(padding: const EdgeInsets.only(top:60)),
                    new Center(
                        child: new Text("Tic Tac Toe", style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white,fontSize: 30),),
                            ),
                      Padding(padding: const EdgeInsets.only(top:30)),
                      AvatarGlow(
                          endRadius: 140,
                          duration: Duration(seconds: 2),
                          glowColor: Colors.white,
                          repeat: true,
                          repeatPauseDuration: Duration(seconds: 1),
                          startDelay: Duration(seconds: 1),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.none
                                  ),
                                      shape:BoxShape.circle
                              ),
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[700],
                                      foregroundColor: Colors.black,

                                      radius: 80.0,
                                      backgroundImage:NetworkImage('https://f0.pngfuel.com/png/923/206/tictactoe-tic-tac-toe-oxo-tac-tic-toe-computer-icons-games-buttons-png-clip-art.png',
                                      ),
                              ),
                          ),
                      ),
                      Padding(padding: const EdgeInsets.only(top:30)),

                      Center(
                     child: RaisedButton(child:new Text("Play Game", style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ,color: Colors.white,fontSize: 30))
                         ,onPressed:  () {
                             Navigator.of(context).pop();
                             Navigator.of(context).push
                                 (new MaterialPageRoute(builder:(BuildContext context)=> new HomePage()));},
                     color: Colors.grey[700],
                     elevation: 30,
                     splashColor: Colors.blueGrey,
                     )
                          ,)

                  ],
                )
            )

        );
    }
}
