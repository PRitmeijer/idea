import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:idea/model/Idea.dart';

final String apiURL = "https://www.boredapi.com/api/activity/";
final styleText = TextStyle(fontSize: 30.0, color: Colors.white);
final List<Color> background = [
  Colors.pinkAccent,
  Colors.orangeAccent,
  Colors.blueAccent,
  Colors.deepPurpleAccent,
  Colors.greenAccent
];

final List<Color> lightBackground = [
  Colors.pinkAccent[100],
  Colors.orangeAccent[100],
  Colors.blueAccent[100],
  Colors.deepPurpleAccent[100],
  Colors.greenAccent[100]
];



class Model {
  List<Container> _deck;
  int _visitedPage;

  Model() {
    this._deck = initDeck();
    this._visitedPage = 0;
  }

  List<Container> get deck => _deck;


  int get visitedPage => _visitedPage;


  Future<Idea> getIdea() async {
    var response = await http.get(apiURL);
    var content = jsonDecode(response.body);
    Idea newIdea = new Idea(content["key"], content["activity"]);
    return newIdea;
  }

  List<Container> initDeck() {
    List<Container> ideaList = new List<Container>();
    for (int i = 0; i < 5; i++) {
      ideaList.add(newIdea(i));
    }
    return ideaList;
  }

  void updateDeck(int page){
    if(page != _visitedPage){
      _deck[_visitedPage] = newIdea(_visitedPage);
    }
    _visitedPage = page;
  }

  Container newIdea(int index) {
    return Container(
        child: FutureBuilder(
          future: getIdea(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                color: Colors.redAccent,
                child: Center(
                  child: Text("Loading...", style: styleText),
                ),
              );
            } else {
              return Container(
                color: background[index],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                            snapshot.data.idea ?? 'error', style: styleText,
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        )
    );
  }
}