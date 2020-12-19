import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
          imageProvider: AssetImage("assets/ttb.jpeg"),
        ),
    );
  }
}