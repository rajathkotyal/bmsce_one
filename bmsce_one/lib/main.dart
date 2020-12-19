import 'package:bmsce_portal/Screens/resources/Resources.dart';
import 'package:bmsce_portal/Screens/timetable.dart';
import 'package:flutter/material.dart';
import 'Screens/screens.dart';
import 'package:bmsce_portal/hp/home_screen_main.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'hp/home_screen_main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
User user;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  // await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
        title: 'BMSCE_ONE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          platform: TargetPlatform.android,
        ),
        home: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              print("data exists");

              return HomeScreenMain();
            } else {
              return LoginPage();
            }
          },
        ));
  }
}

class LoginPage extends StatefulWidget {
  static final String id = 'LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF7F7F7),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              // height: 350,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular((52)),
                      bottomRight: Radius.circular(52)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF000000),
                        blurRadius: 5,
                        spreadRadius: 0.5)
                  ]),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/BMS.png'),
                  height: 200,
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "BMSCE ONE",
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ),
                Text(
                  "Sign in to access your college details",
                  style: TextStyle(fontSize: 15),
                )
              ]),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) => !input.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                        //onSaved: (input) => _email = input,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (input) => input.length < 6
                            ? 'Must be at least 6 characters'
                            : null,
                        //onSaved: (input) => _pass = input,
                        obscureText: true,
                      )),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    width: 250.0,
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _signInWithEmailAndPassword();
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(52))),
                      width: 150.0,
                      child: FlatButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            )),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("${user.email} signed in"),
      // ));
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
