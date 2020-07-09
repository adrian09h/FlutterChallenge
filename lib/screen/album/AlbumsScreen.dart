import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteralbum/controller/api/AlbumAPI.dart';
import 'package:flutteralbum/model/AlbumModel.dart';
import 'package:flutteralbum/screen/album/PhotosScreen.dart';
import 'package:flutteralbum/view/AlbumCell.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  ProgressDialog _progressDialog;
  List<AlbumModel> albums = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 250), () {
      loadAlbums(context);
    });
  }
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
          children: albums.map((album) => AlbumCell(
            album,
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: PhotosScreen(
                          album
                      )));
            },
          )).toList()
      ),
    );
  }
  void loadAlbums(BuildContext context) async {
    if (_progressDialog != null) {
      if (_progressDialog.isShowing()) {
        return;
      }
    }
    _progressDialog = ProgressDialog(context);
    _progressDialog.style(message: "Loading...");
    _progressDialog.show();
    var albums = await AlbumAPI.getAlbums();
    _progressDialog.hide();
    setState(() {
      this.albums = albums;
    });
  }

}
