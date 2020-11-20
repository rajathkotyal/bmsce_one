import 'Settings.dart';
import 'griddashboard.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class ProfileScreen extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _profileText() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Profile',
          style: TextStyle(
            fontSize: 15.0,
            letterSpacing: 1.5,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _circleAvatar() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 5),
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Dwayne_Johnson_at_the_2009_Tribeca_Film_Festival.jpg/220px-Dwayne_Johnson_at_the_2009_Tribeca_Film_Festival.jpg',
            ),
          ),
        ),
      ),
    );
  }

  // Widget _textFormField({
  //   String hintText,
  //   IconData icon,
  // }) {
  //   return Material(
  //     elevation: 4,
  //     shadowColor: Colors.grey,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(
  //         10,
  //       ),
  //     ),
  //     child: TextField(
  //       decoration: InputDecoration(
  //           border: OutlineInputBorder(
  //             borderSide: BorderSide.none,
  //             borderRadius: BorderRadius.circular(
  //               10,
  //             ),
  //           ),
  //           prefixIcon: Icon(
  //             icon,
  //             color: Theme.of(context).primaryColor,
  //           ),
  //           hintText: hintText,
  //           hintStyle: TextStyle(
  //             letterSpacing: 2,
  //             color: Colors.blueGrey,
  //             fontWeight: FontWeight.bold,
  //           ),
  //           filled: true,
  //           fillColor: Colors.white30),
  //     ),
  //   );
  // }

  Widget _profInfo() {
    return Container(
      height: 210,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 65),
      child: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              '       Rajath\n 1BM18CS079',
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 45,
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  '5B, B2 Batch',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'CSE',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            width: 250.0,
            child: FlatButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () async {
                await _auth.signOut();
              },
              color: Colors.cyan,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
          // Container(
          //   height: 45,
          //   width: double.infinity,
          //   child: RaisedButton(
          //     color: Theme.of(context).primaryColor,
          //     child: Center(
          //       child: Text(
          //         'Help',
          //         style: TextStyle(
          //           fontSize: 23,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          // Container(
          //   height: 45,
          //   width: double.infinity,
          //   child: RaisedButton(
          //     color: Theme.of(context).primaryColor,
          //     child: Center(
          //       child: Text(
          //         'Settings',
          //         style: TextStyle(
          //           fontSize: 23,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Settings()),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainApp()),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Text(
              "Edit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_profileText(), _circleAvatar(), _profInfo()],
          ),
        ],
      ),
    );
  }
}

//Color(0xff555555)
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff392850);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
