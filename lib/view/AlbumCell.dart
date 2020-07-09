import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteralbum/model/AlbumModel.dart';

class AlbumCell extends StatelessWidget {
  final AlbumModel album;
  final VoidCallback onTap;
  const AlbumCell(this.album, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Colors.black87),
          child: Center(
            child: Text(
              album.title,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
