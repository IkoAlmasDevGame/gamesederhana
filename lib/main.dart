import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: game(),
      title: "Game Sederhana",
      debugShowCheckedModeBanner: false,
    );
  }
}

class game extends StatefulWidget {
  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  String Gunting = "✌";
  String Kertas = "✋";
  String Batu = "👊";

  // var win = 0;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  var PlayerOneChoose;
  var PlayerTwoChoose;

  final list = [];
  GameplayOne(BuildContext context, PlayerChooseOne){
    setState((){
      isLoading = true;
    });
    if (PlayerChooseOne == Gunting){
      print("Player one Mengeluarkan : ${Gunting}");
    }else if(PlayerChooseOne == Kertas){
      print("Player one Mengeluarkan :  ${Kertas}");
    }else if(PlayerChooseOne == Batu){
      print("Player one Mengeluarkan :  ${Batu}");
    }else{
      return null;
    }
    PlayerOneChoose = PlayerChooseOne;
    setState((){
      isLoading = false;
    });
  }

  GameplayTwo(BuildContext context, PlayerChooseTwo){
    setState((){
      isLoading = true;
    });
    if (PlayerChooseTwo == Gunting){
      print("Player dua Mengeluarkan : ${Gunting}");
    }else if(PlayerChooseTwo == Kertas){
      print("Player dua Mengeluarkan :  ${Kertas}");
    }else if(PlayerChooseTwo == Batu){
      print("Player dua Mengeluarkan :  ${Batu}");
    }else{
      return null;
    }
    PlayerTwoChoose = PlayerChooseTwo;
    setState((){
      isLoading = false;
    });
  }

  HomeGame(){
    return Builder(
      builder: (BuildContext context){
        return ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 60)),
            Center(child: Text("PLAYER 1", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () => GameplayOne(context, Gunting),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text("${Gunting}", style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                RaisedButton(
                  onPressed: () => GameplayOne(context, Kertas),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text("${Kertas}", style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                RaisedButton(
                  onPressed: () => GameplayOne(context, Batu),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text("${Batu}", style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 160)),
            Center(child: Text("PLAYER 1 : ${PlayerOneChoose.toString()}\n\n == VS == \n\nPAYER 2 : ${PlayerTwoChoose.toString()}", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
            Padding(padding: EdgeInsets.only(top: 20)),
            Center(
              child: InkWell(
                child: Text("RESET", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                onTap: (){
                  setState((){
                    PlayerOneChoose = "";
                    PlayerTwoChoose = "";
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 150)),
            Center(child: Text("PLAYER 2", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () => GameplayTwo(context, Gunting),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text("${Gunting}", style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                RaisedButton(
                  onPressed: () => GameplayTwo(context, Kertas),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text("${Kertas}", style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                RaisedButton(
                  onPressed: () => GameplayTwo(context, Batu),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text("${Batu}", style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(100, 150, 72, 1),
      body: HomeGame(),
    );
  }
}

