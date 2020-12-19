import 'package:bmsce_portal/Screens/aboutUs.dart';
import 'package:bmsce_portal/Screens/resources/websyl.dart';
import 'package:bmsce_portal/Screens/screens.dart';
import 'package:bmsce_portal/Screens/timetable.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:bmsce_portal/Screens/resources/Resources.dart';
import 'package:bmsce_portal/hp/app_theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
var action = [
  Resources(),
  TimeTable(),
  WebSyllabus(),
  Results(),
  AboutUs()
];


class _ProfilePageState extends State<ProfilePage> {
  bool _isOpen = false;
  PanelController _panelController = PanelController();

  var _buttonList = [
    'Resources',
    'Time Table',
    'Syllabus',
    'Results',
    'About Us',
  ];

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************
  /// Panel Body
  SingleChildScrollView _panelBody(ScrollController controller) {
    double hPadding = 40;


    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 100),
              itemCount: _buttonList.length,
              // listDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 3,
              //   mainAxisSpacing: 16,
              // ),

              itemBuilder: (BuildContext context, int index) => RaisedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => action[index])),
                //borderSide: BorderSide(color: Colors.blue),
                color: AppTheme.nearlyBlue,
                elevation: 4,
                animationDuration: Duration(milliseconds: 10),
                highlightElevation: 20,
                splashColor: Colors.greenAccent,
                shape: StadiumBorder(
                ),
                child: Text(
                  _buttonList[index],
                  style: TextStyle(
                    fontFamily: 'NimbusSanL',
                    fontSize: 18,
                    //fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

            ),
          SizedBox(height: 20,),
          OutlineButton(
            onPressed: () => print("Logout"),
            borderSide: BorderSide(color: Colors.blue),
            splashColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'NimbusSanL',
                fontSize: 20,
                //fontWeight: FontWeight.w700,
              ),
            ),
          ),


          // GridView.builder(
          //   primary: false,
          //   shrinkWrap: true,
          //   padding: EdgeInsets.zero,
          //   itemCount: _buttonList.length,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     mainAxisSpacing: 16,
          //   ),
          //   itemBuilder: (BuildContext context, int index) => RaisedButton(
          //     child: Text("Settings"),
          //     onPressed: (){print("settings");},
          //   )
          // )

        ],
      ),
    );
  }

  /// Action Section
  Row _actionSection({double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlineButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   TimeTable(),
                  )),
              borderSide: BorderSide(color: Colors.blue),
              splashColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'Time Table',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 18,
                  //fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isOpen,
          child: SizedBox(
            width: 26,
          ),
        ),
        SizedBox(height: 30),
        Visibility(
          visible: _isOpen,

          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: _isOpen
                    ? (MediaQuery.of(context).size.width - (2 * hPadding)) /4
                    : double.infinity,
                child: Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'MD',
                      fontSize: 26,

                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
        ),
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: Container(
              // alignment: Alignment.center,
              // child: SizedBox(
              //   width: _isOpen
              //       ? (MediaQuery.of(context).size.width - (2 * hPadding)) / 1.6
              //       : double.infinity,
                child: FlatButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   Resources())),
                  color: AppTheme.nearlyBlue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Resources',
                    style: TextStyle(
                      fontFamily: 'NimbusSanL',
                      fontSize: 18,
                      //fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
        ),

      ],
    );
  }

  /// Info Section
  Row _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _infoCell(title: 'Sem', value: '5th Sem'),
        InkWell(
          child: Container(
            width: 1,
            height: 40,
            color: Colors.grey,
          ),
        ),
        _infoCell(title: 'USN', value: "1BM18CS079"),
        Container(
          width: 1,
          height: 40,
          color: Colors.black,
        ),
        _infoCell(title: 'Branch', value: 'CSE'),
      ],
    );
  }

  /// Info Cell
  Column _infoCell({String title, String value}) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
    return Column(
      children: <Widget>[
        Text(
          'Dwayne Johnson',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Student',
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}