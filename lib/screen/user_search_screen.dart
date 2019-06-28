import 'package:flutter/material.dart';

import 'package:search_users/model/user.dart';
import 'package:search_users/network/user_api_request.dart';
import 'package:search_users/screen/user_detail_screen.dart';
import 'package:search_users/common/widget_key.dart';

import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User> _users = [];
  bool _isLoading = false;
  String _textStatus = "Search Github User by username";
  TextEditingController _textEditingController = TextEditingController();

  Future search(String username) async {
    isLoading(true);
    List<User> result = await searchUser(username);

    if (this.mounted) {
      setState(() {
        isLoading(false);
        _users = result;

        if (_users.isEmpty) {
          _textStatus = "No result for $username";
        }
      });
    }
  }

  isLoading(bool loading) {
    setState(
      () {
        _isLoading = loading;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (_, inner) {
            return [
              SliverAppBar(
                title: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      key: Key(SEARCH_FIELD),
                      controller: _textEditingController,
                      decoration: InputDecoration.collapsed(
                        hintText: "Username...",
                      ),
                    ),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    key: Key(SEARCH_BUTTON),
                    icon: Icon(Icons.search),
                    onPressed: () {
                      var username = _textEditingController.text;
                      search(username);
                    },
                  )
                ],
              ),
            ];
          },
          body: buildPage(),
        ),
      ),
    );
  }

  Widget buildPage() {
    if (!_isLoading) {
      if (_users.isEmpty) {
        return Center(
          child: Text(_textStatus),
        );
      } else {
        return ListView.builder(
          key: Key(SEARCH_CONTENT),
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                key: Key(CONTENT_KEY + index.toString()),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(user: _users[index]),
                      ));
                },
                title: Text(_users[index].username),
                subtitle: Text(_users[index].htmlUrl),
                leading: Hero(
                  tag: _users[index].id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: _users[index].userPic,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
