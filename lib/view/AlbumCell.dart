import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumCell extends StatelessWidget {
  final VoidCallback onTap;
  const AlbumCell({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Colors.black87),
          child: Center(
            child: Text(
              "culpa odio esse rerum omnis laboriosam voluptate repudiandae asdasd asd as asd asd asd asd asd ",
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
