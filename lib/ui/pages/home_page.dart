import 'dart:math';

import 'package:flutter/material.dart';

import '../shared/widgets/avatar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      body: _body(),
    );
  }

  Widget _appBar({@required BuildContext context}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Avatar(url: 'https://picsum.photos/200'),
      ),
      title: Text(
        'Página Incial',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 8.0,
          ),
          child: Icon(
            Icons.info,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return Container(
      child: _postList(),
    );
  }

  ListView _postList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _postItem(context: context);
      },
    );
  }

  Padding _postItem({@required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Avatar(url: 'https://picsum.photos/200'),
              SizedBox(width: 8.0),
              Flexible(
                child: Column(
                  children: <Widget>[
                    _texts(context: context),
                    _icons(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _texts({@required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Lorem ipsum',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5.0),
            Text(
              '@lipsum',
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 12.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                '-',
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 12.0,
                ),
              ),
            ),
            Text(
              '${Random().nextInt(59)} minutos',
              style: TextStyle(
                color: Colors.grey,
                // fontSize: 12.0,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Mussum Ipsum, cacilds vidis litro abertis. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Si num tem leite então bota uma pinga aí cumpadi!',
            style: TextStyle(fontSize: 12.0),
            textAlign: TextAlign.start,
            maxLines: 4,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.chat, size: 16, color: Colors.grey),
        Icon(Icons.repeat, size: 16, color: Colors.grey),
        Icon(Icons.favorite, size: 16, color: Colors.grey),
        Icon(Icons.share, size: 16, color: Colors.grey),
      ],
    );
  }
}
