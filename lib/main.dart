import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QTwitter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://picsum.photos/200',
          ),
        ),
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

  Widget _body() => Container();
}
