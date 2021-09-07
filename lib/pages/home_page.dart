import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(_name == null ? 'Insert your name.' : _name!),
          ),
          ElevatedButton(
              onPressed: () async {
                dynamic result = await Navigator.of(context)
                    .pushNamed('product', arguments: 'qwe123');

                setState(() {
                  _name = result;
                });
              },
              child: Text('Go To Name Page'))
        ],
      ),
    );
  }
}
