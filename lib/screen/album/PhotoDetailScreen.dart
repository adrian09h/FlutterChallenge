import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatefulWidget {
  @override
  _PhotoDetailScreenState createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Photo Detail"
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        children: [
          CachedNetworkImage(
            imageUrl: "https://via.placeholder.com/600/f66b97",
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => CachedNetworkImage(
              imageUrl: "https://via.placeholder.com/150/d32776",
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
            style: TextStyle(
                fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Album ID: 123",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          SizedBox(height: 8),
          Text(
            "ID: 123",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ],
      ),
    );
  }
}
