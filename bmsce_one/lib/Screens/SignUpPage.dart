import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  static final String id = 'SignUpPage';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future<void> resetPassword() async {
    await _auth.sendPasswordResetEmail(email: _emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  "Sign Up to get started",
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
                        // onSaved: (input) => _email = input,
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
                      padding: EdgeInsets.all(10.0),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          resetPassword();
                        }
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
