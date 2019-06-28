import 'package:flutter/material.dart';

import 'package:search_users/model/user.dart';
import 'package:search_users/network/user_api_request.dart';
import 'package:search_users/common/widget_key.dart';

import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends StatefulWidget {
  final User user;

  DetailScreen({Key key, this.user}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isLoading = true;
  User _user;

  Future loadDetail() async {
    User result = await getDetailUser(widget.user.userDetailUrl);

    if (this.mounted) {
      setState(() {
        _isLoading = false;
        _user = result;
      });
    }
  }

  Widget rowInfo(String text, String title) {
    return Column(
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
        Text(title)
      ],
    );
  }

  @override
  void initState() {
    loadDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: Key(DETAIL_LEADING),
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(widget.user.username),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Hero(
              key: Key(DETAIL_IMAGE),
              tag: widget.user.id,
              child: Padding(
                padding: EdgeInsets.only(top: 100, bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    height: 150,
                    width: 150,
                    imageUrl: widget.user.userPic,
                  ),
                ),
              ),
            ),
            buildPage()
          ],
        ),
      ),
    );
  }

  Widget buildPage() {
    if (!_isLoading) {
      if (_user == null) {
        return Center(
          child: Text("Failed to show user detail"),
        );
      } else {
        return Column(
          key: Key(DETAIL_CONTENT),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  _user.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("@${_user.username}"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    rowInfo(_user.following.toString(), "Following"),
                    rowInfo(_user.followers.toString(), "Followers"),
                    rowInfo(_user.repos.toString(), "Repository"),
                  ],
                ),
              ),
            ]);
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
