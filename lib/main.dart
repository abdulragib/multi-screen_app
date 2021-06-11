import 'package:flutter/material.dart';

main() {
  runApp(new MaterialApp(
    title: 'Screens',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
              title: new TextField(
            controller: _nameFieldController,
            decoration: new InputDecoration(
              labelText: 'Enter Your Name',
            ),
          ),
          ),

          new ListTile(
            title: new ElevatedButton(
              onPressed: () {
                var router = new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new NextScreen(_nameFieldController.text);
                  },
                );
                Navigator.of(context).push(router);
              },
              child: new Text("Send to Next Screen"),
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;
  NextScreen(this.name);
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
      backgroundColor: Colors.greenAccent,
      title: new Text('Second Screen'),
      centerTitle: true,
    ),

    body: new ListTile(
        title: new Text('${widget.name}'),
    ),
    );
  }
}
