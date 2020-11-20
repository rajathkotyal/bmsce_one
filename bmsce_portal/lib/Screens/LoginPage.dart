// import 'SignUpPage.dart';
// import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class LoginPage extends StatefulWidget {
//   static final String id = 'LoginPage';
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'BMSCE One',
//             style: TextStyle(fontSize: 50.0),
//           ),
//           Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 10),
//                     child: TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(labelText: 'Email'),
//                       validator: (input) => !input.contains('@')
//                           ? 'Please enter a valid email'
//                           : null,
//                       //onSaved: (input) => _email = input,
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 10),
//                     child: TextFormField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(labelText: 'Password'),
//                       validator: (input) => input.length < 6
//                           ? 'Must be at least 6 characters'
//                           : null,
//                       //onSaved: (input) => _pass = input,
//                       obscureText: true,
//                     )),
//                 SizedBox(
//                   height: 25.0,
//                 ),
//                 Container(
//                   width: 250.0,
//                   child: FlatButton(
//                     padding: EdgeInsets.all(10.0),
//                     onPressed: () async {
//                       if (_formKey.currentState.validate()) {
//                         _signInWithEmailAndPassword();
//                       }
//                     },
//                     color: Colors.cyan,
//                     child: Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white, fontSize: 18.0),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 250.0,
//                   child: FlatButton(
//                     onPressed: () =>
//                         Navigator.pushNamed(context, SignUpPage.id),
//                     color: Colors.transparent,
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(color: Colors.cyan, fontSize: 18.0),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _signInWithEmailAndPassword() async {
//     try {
//       final User user = (await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       ))
//           .user;

//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text("${user.email} signed in"),
//       ));
//     } catch (e) {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text("Failed to sign in with Email & Password"),
//       ));
//     }
//   }
// }
