import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff2E2E2E),
    ),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      initialRoute: '/xplashScreen',
      routes: {
        '/xplashScreen': (context) => XplashScreen(),
        '/': (context) => QuizApp(),
        '/rexult': (context) => Rexult(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );
}

class XplashScreen extends StatefulWidget {
  const XplashScreen({Key key}) : super(key: key);

  @override
  _XplashScreenState createState() => _XplashScreenState();
}

class _XplashScreenState extends State<XplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new QuizApp(),
      title: new Text(
        'Quiz App',
        style: TextStyle(
          color: Color(0xff2E2E2E),
          fontSize: 25.0,
        ),
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      loaderColor: Color(0xff2E2E2E),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  static const abColor = Color(0xff2E2E2E);
  static const scfColor = Color(0xffEEF8F7);
  static const textColor = Color(0xff010506);
  static const btnColor = Color(0xffDC7364);
  static const btnTxtColor = Color(0xffEEF8F7);

  List<Widget> scoreKeeper = [];

  List<String> questions = [
    "The different build modes in Flutter are Debug, Profile & Release",
    "Dart is not a garbage-collected programming language",
    "Dart is Just In Time compiled language",
    "Function runApp()  should return Widget that would be attached to the screen as a root of the Widget Tree that will be rendered",
    "In Hot restart it destroys the preserves State value and set them to their default",
    "Hot Reload takes much higher time than Hot Restart",
    "Synchronous programming in Dart is characterized by the Future and Stream classes",
    "We use release mode for deploying the app, when you want maximum optimization and minimal footprint size",
  ];

  List<String> answers = ['T', 'F', 'T', 'T', 'T', 'F', 'F', 'T'];

  int queNo = 0;

  int correctAns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scfColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Quiz App',
          style: TextStyle(
            fontSize: 27.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: abColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: SingleChildScrollView(
                child: Text(
                  '${questions[queNo]}?',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: MaterialButton(
                      color: btnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: 50.0,
                      minWidth: double.infinity,
                      onPressed: () {
                        if (answers[queNo] == 'T') {
                          setState(() {
                            if (queNo == questions.length - 1) {
                              scoreKeeper
                                  .add(Icon(Icons.check, color: Colors.green));
                              correctAns += 1;
                              print('terminated');
                              Navigator.pushReplacementNamed(
                                context,
                                '/rexult',
                                arguments: {
                                  'result': "$correctAns / ${questions.length}"
                                },
                              );
                            } else {
                              scoreKeeper
                                  .add(Icon(Icons.check, color: Colors.green));
                              correctAns += 1;
                              queNo += 1;
                            }
                          });
                        } else {
                          setState(() {
                            if (queNo == questions.length - 1) {
                              print('terminated');
                              Navigator.pushReplacementNamed(
                                context,
                                '/rexult',
                                arguments: {
                                  'result': "$correctAns / ${questions.length}"
                                },
                              );
                            } else {
                              scoreKeeper
                                  .add(Icon(Icons.close, color: Colors.red));
                              queNo += 1;
                            }
                          });
                        }
                      },
                      child: Text(
                        'TRUE',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: btnTxtColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: MaterialButton(
                      color: btnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: 50.0,
                      minWidth: double.infinity,
                      onPressed: () {
                        if (answers[queNo] == 'F') {
                          setState(() {
                            if (queNo == questions.length - 1) {
                              scoreKeeper
                                  .add(Icon(Icons.check, color: Colors.green));
                              correctAns += 1;
                              Navigator.pushReplacementNamed(
                                context,
                                '/rexult',
                                arguments: {
                                  'result': "$correctAns / ${questions.length}"
                                },
                              );
                            } else {
                              scoreKeeper
                                  .add(Icon(Icons.check, color: Colors.green));
                              correctAns += 1;
                              queNo += 1;
                            }
                          });
                        } else {
                          setState(() {
                            if (queNo == questions.length - 1) {
                              Navigator.pushReplacementNamed(
                                context,
                                '/rexult',
                                arguments: {
                                  'result': "$correctAns / ${questions.length}"
                                },
                              );
                            } else {
                              scoreKeeper
                                  .add(Icon(Icons.close, color: Colors.red));
                              queNo += 1;
                            }
                          });
                        }
                      },
                      child: Text(
                        'FALSE',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: btnTxtColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreKeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Rexult extends StatefulWidget {
  const Rexult({Key key}) : super(key: key);

  @override
  _RexultState createState() => _RexultState();
}

class _RexultState extends State<Rexult> {
  static const abColor = Color(0xff2E2E2E);
  static const scfColor = Color(0xffEEF8F7);
  static const textColor = Color(0xff010506);
  static const btnColor = Color(0xffDC7364);
  static const btnTxtColor = Color(0xffEEF8F7);

  var data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: scfColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Quiz App',
          style: TextStyle(
            fontSize: 27.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: abColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: SingleChildScrollView(
                child: Text(
                  'Your result is ${data['result']}.',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: MaterialButton(
                color: btnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 50.0,
                minWidth: double.infinity,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/',
                  );
                },
                child: Text(
                  'Retest',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: btnTxtColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
