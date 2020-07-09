import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteralbum/screen/album/PhotosScreen.dart';
import 'package:flutteralbum/view/AlbumCell.dart';
import 'package:page_transition/page_transition.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Albums"
        ),
      ),
      body: GridView.count(
          padding: EdgeInsets.all(12),
          crossAxisCount: 2,
          childAspectRatio: 2,
          children: ["", "", "", "", "", "", "", "", "", "", "", "", "", "", ""].map((e) => AlbumCell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PhotosScreen(
                      )));
            },
          )).toList()
      ),
    );
  }
}
