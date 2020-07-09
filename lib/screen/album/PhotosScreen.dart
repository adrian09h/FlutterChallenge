import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteralbum/screen/album/PhotoDetailScreen.dart';
import 'package:flutteralbum/view/PhotoCell.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PhotosScreen extends StatefulWidget {
  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  int curPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Photos"
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
          itemCount: 10,
          itemBuilder: (context, index) {
            return PhotoCell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: PhotoDetailScreen(
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
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    curPage = curPage + 1;
    refreshController.loadComplete();
  }

}
