import 'search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';
import 'profile.dart';
import 'Settings.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    Future<bool> _onBackPressed() {
      Navigator.pop(context);
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyPage(),
        routes: <String, WidgetBuilder>{
          "/Search": (BuildContext context) => Search(),
          "/Profile": (BuildContext context) => ProfileScreen(),
          // "/Help": (BuildContext context) => Help(),
          // "/Feedback": (BuildContext context) => FeedBack(),
          "/Settings": (BuildContext context) => Settings(),
          //'/signinmain': (BuildContext context) => SignIn(),
        },
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  //String title;
  MyPage({Key key}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<MyPage> {
  // /*FIREBASE*/
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // FirebaseUser user;
  // bool isSignedIn = false;
  // String imageUrl;

  // checkAuthentication() async {
  //   _auth.onAuthStateChanged.listen((user) {
  //     if (user == null) {
  //       Navigator.pushReplacementNamed(context, '/Profile');
  //     }
  //   });
  // }

  // getUser() async {
  //   FirebaseUser firebaseUser = await _auth.currentUser();
  //   await firebaseUser?.reload();
  //   firebaseUser = await _auth.currentUser();

  //   if (firebaseUser != null) {
  //     setState(() {
  //       this.user = firebaseUser;
  //       this.isSignedIn = true;
  //       this.imageUrl = user.photoUrl;
  //     });
  //   }
  //   print("${user.displayName} is the user ${user.photoUrl}");
  // }

  // signout() async {
  //   _auth.signOut();
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   this.checkAuthentication();
  //   this.getUser();
  // }

  // /* FIREBASE */

  int _selectedIndex = 0;
  // double progressValue = 12.0;

  Future<bool> _navBack() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyPage()),
    );
  }

  var pages = [
    HomePage(), //deals
    Search(),
    ProfileScreen(),
  ];

  //static const List<Widget> _widgetOptions = <Widget>

  void _onItemTappedB(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _navBack,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            " BMSCE ONE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              letterSpacing: 2.0,
              color: Colors.white,
              fontFamily: "Nexa_Light",
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          iconTheme: new IconThemeData(color: Colors.white),
          elevation: 7,
          shadowColor: Colors.black,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                //currentAccountPicture: Image.network("https://www.google.co.in/imgres?imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D129129487743&imgrefurl=https%3A%2F%2Fwww.facebook.com%2FProfilePictures%2F&tbnid=2DnrLk3Tlyfo4M&vet=12ahUKEwjTyYWW_-3rAhWaNCsKHSqLCy4QMygDegUIARDUAQ..i&docid=8eDeiABW8CreFM&w=200&h=200&q=profile%20image&safe=active&ved=2ahUKEwjTyYWW_-3rAhWaNCsKHSqLCy4QMygDegUIARDUAQ"),
                accountName: Text("Hello Rajath"),
                accountEmail: Text("abcd@gmail.com"),
                // accountEmail: Text("${user.email}"),
                // decoration: BoxDecoration(
                //   color: Colors.blue[900],
                // ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('food.png'),
                  maxRadius: 40,
                  minRadius: 30,
                ),
              ),
              ListTile(
                  title: Text("Profile"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/Profile");
                  }),
              ListTile(
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/Settings");
                  }),
              ListTile(
                  title: Text("Help"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/Help");
                  }),
              ListTile(
                  title: Text("Feedback"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/Feedback");
                  }),

              // ListTile(
              //   title: Text("Log Out"),
              //   onTap: signout,
              // ),
              ListTile(
                title: Text("Close"),
                trailing: Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        // body: !isSignedIn // setting isSignedIn to true
        //     ? CircularProgressIndicator()
        body: pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text('Home'),
                icon: Icon(Icons.home),
                backgroundColor: Colors.greenAccent),
            BottomNavigationBarItem(
                title: Text('search'),
                icon: Icon(Icons.search),
                backgroundColor: Colors.greenAccent),
            BottomNavigationBarItem(
                title: Text('profile'),
                icon: Icon(Icons.person),
                backgroundColor: Colors.greenAccent),
          ],
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTappedB,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   Future<bool> _onBackPressedHome() {
    //     return showDialog(
    //       context: context,
    //       builder: (context) => new AlertDialog(
    //         title: new Text('Are you sure?'),
    //         content: new Text('Do you want to exit an App'),
    //         actions: <Widget>[
    //           new GestureDetector(
    //             onTap: () => Navigator.of(context).pop(false),
    //             child: Text("NO"),
    //           ),
    //           SizedBox(height: 16),
    //           new GestureDetector(
    //             onTap: () => Navigator.of(context).pop(true),
    //             child: Text("YES"),
    //           ),
    //         ],
    //       ),
    //     ) ??
    //         false;
    //   }

    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Rajath ",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "1BM18CS079",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}
