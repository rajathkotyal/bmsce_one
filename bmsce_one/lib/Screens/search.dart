import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),

        // decoration: BoxDecoration(
        //   color: Colors.black38.withAlpha(10),
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(20),
        //   ),
        // ),
        child: Row(
          children: <Widget>[

            Expanded(
              child: Text("Search Results",
                style: TextStyle(
                  fontFamily: 'MB',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: 1.5,
                  color: Colors.blue,
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.black.withAlpha(120),
            )
          ],
        ),
      ),
    );
  }
}
