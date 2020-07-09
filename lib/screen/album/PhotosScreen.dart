
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteralbum/controller/api/AlbumAPI.dart';
import 'package:flutteralbum/model/AlbumModel.dart';
import 'package:flutteralbum/model/PhotoModel.dart';
import 'package:flutteralbum/screen/album/PhotoDetailScreen.dart';
import 'package:flutteralbum/view/PhotoCell.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PhotosScreen extends StatefulWidget {
  final AlbumModel album;
  const PhotosScreen(this.album);
  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  ProgressDialog _progressDialog;
  List<PhotoModel> photos = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);
  int curPage = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 250), () {
      loadPhotos(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Album ${widget.album.id}"
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              return Container();
            }
            if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            }
            if (mode == LoadStatus.failed) {
              return Container();
            }
            if (mode == LoadStatus.canLoading) {
              body = Text("Release to load more");
            }
            return Container(
              height: 50,
              child: Center(
                child: body,
              ),
            );
          },
        ),
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return PhotoCell(
              photos[index],
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: PhotoDetailScreen(
                          photos[index]
                        )));

              },
            );
          },
        ),
      ),
    );
  }
  void onRefresh() async {
    curPage = 1;
    var photos = await AlbumAPI.getPhotos(widget.album.id, page: curPage);
    setState(() {
      this.photos = photos;
    });
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    curPage = curPage + 1;
    var photos = await AlbumAPI.getPhotos(widget.album.id, page: curPage);
    setState(() {
      this.photos = this.photos + photos;
    });
    refreshController.loadComplete();
  }
  void loadPhotos(BuildContext context) async {
    if (_progressDialog != null) {
      if (_progressDialog.isShowing()) {
        return;
      }
    }
    _progressDialog = ProgressDialog(context);
    _progressDialog.style(message: "Loading...");
    _progressDialog.show();
    var photos = await AlbumAPI.getPhotos(widget.album.id, page: curPage);
    _progressDialog.hide();
    setState(() {
      this.photos = photos;
    });
  }

}
