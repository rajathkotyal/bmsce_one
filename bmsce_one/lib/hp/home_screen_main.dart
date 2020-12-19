import 'package:bmsce_portal/Screens/profile.dart';
import 'package:bmsce_portal/Screens/profileNew.dart';
import 'package:bmsce_portal/Screens/screens.dart';
import 'package:bmsce_portal/hp/category_list_view.dart';
import 'package:bmsce_portal/hp/course_info_screen.dart';
import 'package:bmsce_portal/hp/news_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_theme.dart';

class HomeScreenMain extends StatefulWidget {
  @override
  _HomeScreenMainState createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  //CategoryType categoryType = CategoryType.ui;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      //getSearchBarUI(),
                      SizedBox(height: 30,),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:10.0),
                        child:Container(
                          height:1.0,
                          width:340.0,
                          color:Colors.grey[300],),),
                      SizedBox(height: 30,),

                      getClasses(),
                      Flexible(
                        child: getNewsUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget getSearchBarUI() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 8.0, left: 18),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Container(
  //           width: MediaQuery.of(context).size.width * 0.75,
  //           height: 64,
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 8, bottom: 8),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: HexColor('#F8FAFB'),
  //                 borderRadius: const BorderRadius.only(
  //                   bottomRight: Radius.circular(13.0),
  //                   bottomLeft: Radius.circular(13.0),
  //                   topLeft: Radius.circular(13.0),
  //                   topRight: Radius.circular(13.0),
  //                 ),
  //               ),
  //               child: Row(
  //                 children: <Widget>[
  //                   Expanded(
  //                     child: Container(
  //                       padding: const EdgeInsets.only(left: 16, right: 16),
  //                       child: TextFormField(
  //                         style: TextStyle(
  //                           fontFamily: 'WorkSans',
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 16,
  //                           color: AppTheme.nearlyBlue,
  //                         ),
  //                         keyboardType: TextInputType.text,
  //                         decoration: InputDecoration(
  //                           labelText: 'Search',
  //                           border: InputBorder.none,
  //                           helperStyle: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 16,
  //                             color: HexColor('#B9BABC'),
  //                           ),
  //                           labelStyle: TextStyle(
  //                             fontWeight: FontWeight.w600,
  //                             fontSize: 16,
  //                             letterSpacing: 0.2,
  //                             color: HexColor('#B9BABC'),
  //                           ),
  //                         ),
  //                         onEditingComplete: () {
  //                           Navigator.push(
  //                               context,
  //                               MaterialPageRoute(builder: (context) => Search()));
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: 60,
  //                     height: 60,
  //                     child: Icon(Icons.search, color: HexColor('#B9BABC')),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         const Expanded(
  //           child: SizedBox(),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    letterSpacing: 0.2,
                    color: AppTheme.grey,
                  ),
                ),
                Text(
                  'Rajath Kotyal',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: AppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Container(
              width: 60,
              height: 60,
              child: Image.asset('assets/userImage.png'),

            ),
          )
        ],
      ),
    );
  }

  Widget getClasses() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Classes',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AppTheme.darkerText,
            ),
          ),
        ),

        CategoryListView(
          callBack: () {
            moveTo();
          },
        ),
        SizedBox(height: 20,)
      ],
    );
  }

  Widget getNewsUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Latest News',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AppTheme.darkerText,
            ),
          ),
          Flexible(
            child: NewsListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

  // Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
  //    String txt = '';
  //
  //   return Expanded(
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: isSelected
  //               ? AppTheme.nearlyBlue
  //               : AppTheme.nearlyWhite,
  //           borderRadius: const BorderRadius.all(Radius.circular(24.0)),
  //           border: Border.all(color: AppTheme.nearlyBlue)),
  //       child: Material(
  //         color: Colors.transparent,
  //         child: InkWell(
  //           splashColor: Colors.white24,
  //           borderRadius: const BorderRadius.all(Radius.circular(24.0)),
  //           onTap: () {
  //             setState(() {
  //               categoryType = categoryTypeData;
  //             });
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.only(
  //                 top: 12, bottom: 12, left: 18, right: 18),
  //             child: Center(
  //               child: Text(
  //                 txt,
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 12,
  //                   letterSpacing: 0.27,
  //                   color: isSelected
  //                       ? AppTheme.nearlyWhite
  //                       : AppTheme.nearlyBlue,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //
  //   );
  // }


}



_launchURL() async {
  const url = 'https://meet.google.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}