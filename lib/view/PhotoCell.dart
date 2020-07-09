import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteralbum/model/PhotoModel.dart';

class PhotoCell extends StatelessWidget {
  final PhotoModel photo;
  final VoidCallback onTap;
  const PhotoCell(this.photo, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black12),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: photo.thumbnailUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Album ID: ${photo.albumId}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "ID: ${photo.id}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      photo.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
