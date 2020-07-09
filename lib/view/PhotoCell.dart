import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoCell extends StatelessWidget {
  final VoidCallback onTap;
  const PhotoCell({this.onTap});

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
                  imageUrl: "https://via.placeholder.com/150/d32776",
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
                      "Album id: 123",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "id: 123",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
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
