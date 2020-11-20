import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black38.withAlpha(10),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Anything BMSCE",
                  hintStyle: TextStyle(
                    color: Colors.black.withAlpha(120),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (String keyword) {},
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
