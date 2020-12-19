import 'package:flutter/material.dart';
import 'search.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,
          children: [
            Container(
              child: Text('ABOUT US',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  letterSpacing: 0.2,
                ),
              ),

            ),
            SizedBox(height: 100,),
            Container(
              child: Text('Designed by',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  letterSpacing: 0.2,
                ),
              ),

              ),
            SizedBox(height: 20),
             Container(
                child: Text(
                    'Pranjal Sinha - 1BM18CS073\nRajath MK - 1BM18CS079\nMS Sathwick Kiran - 1BM18CS050\nRahul Patil - 1BM18CS077',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  letterSpacing: 0.2,

                ),
                ),
              ),
            SizedBox(height: 90),
            Container(
              child: Text('Contact us at :\nbmsceOne@gmail.com',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child : Text('\u00a9 BMSCE_ONE',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  letterSpacing: 0.2,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }


}