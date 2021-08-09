import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:bubble/bubble.dart';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ace ChatBot',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff273854),
      ),
      home: Intro(),
      routes: {ChatScreen.routeName: (_) => ChatScreen()},
    );
  }
}

class Intro extends StatefulWidget {
  static const routeName = '/introPage';
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Container(
                  child: FadeAnimatedTextKit(
                    repeatForever: true,
                    text: [
                      'Chat Bot',
                      'More than an App',
                    ],
                    textStyle: TextStyle(
                        color: Color(0xffc7ecee),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: MaterialButton(
                  elevation: 15,
                  height: 44,
                  minWidth: 200,
                  color: Color(0xffff6b81),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Lets Talk',
                    style: TextStyle(
                        fontSize: 41,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2f3640)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/chatScreen');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  static const routeName = '/chatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _data = [];
  static const String BOT_URL =
      "https://cf775b3a38a3.ngrok.io/bot"; // replace with server address
  TextEditingController _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0) +
                  EdgeInsets.symmetric(horizontal: 12),
              child: AnimatedList(
                  scrollDirection: Axis.vertical,
                  // key to call remove and insert from anywhere
                  key: _listKey,
                  initialItemCount: _data.length,
                  itemBuilder:
                      (BuildContext context, int index, Animation animation) {
                    return _buildItem(_data[index], animation, index);
                  }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFF757B),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      hintText: "Lets Talk",
                    ),
                    controller: _queryController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg) {
                      this._getResponse();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  http.Client _getClient() {
    return http.Client();
  }

  void _getResponse() {
    if (_queryController.text.length > 0) {
      this._insertSingleItem(_queryController.text);
      var client = _getClient();
      try {
        client.post(
          BOT_URL,
          body: {"query": _queryController.text},
        )..then((response) {
            Map<String, dynamic> data = jsonDecode(response.body);
            _insertSingleItem(data['response'] + "<bot>");
          });
      } catch (e) {
        print("Failed -> $e");
      } finally {
        client.close();
        _queryController.clear();
      }
    }
  }

  void _insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState.insertItem(_data.length - 1);
  }

  Widget _buildItem(String item, Animation animation, int index) {
    bool mine = item.endsWith("<bot>");
    return SizeTransition(
        sizeFactor: animation,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Container(
              alignment: mine ? Alignment.topLeft : Alignment.topRight,
              child: Bubble(
                nip: mine ? BubbleNip.leftTop : BubbleNip.rightTop,
                elevation: 7,
                nipHeight: 24,
                radius: Radius.circular(14),
                child: Text(item.replaceAll("<bot>", "")),
                color: mine ? Color(0xffFFFFFF) : Color(0xff55EFC4),
                padding: BubbleEdges.all(10),
              )),
        ));
  }
}
