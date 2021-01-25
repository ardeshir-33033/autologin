import 'package:flutter/material.dart';
import 'package:flutter_app/sec.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
     initialize().then((value) {
      if(known().getAutoLogin() == '1'){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => secPage()));
      }
    });
  }
  Future initialize()async{
      await getUser();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('data'),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => secPage()));
              },
              child: Text('go'),
            ),
            RaisedButton(
              onPressed: () {
                setUserLocaly();
              },
              child: Text('always'),
            )
          ],
        ),
      ),
    );
  }

  void setUserLocaly() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('autoLogin', '1');
  }

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    known().setAutoLogin(
      prefs.getString('autoLogin'),
    );
  }
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}

class known {
  static String autoLogin;

  String getAutoLogin() {
    return autoLogin;
  }

  void setAutoLogin(String val) {
    autoLogin = val;
  }
}
