



import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  String? _nameInput;
  String? _param;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _param = ModalRoute.of(context)!.settings.arguments as String?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Page'),
      ),
      body: Column(
        children: [
          ListTile(title: Text('Insert your name:'),),
          ListTile(title: Text(_param!),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Name'
              ),
              onChanged: (text) {
                _nameInput = text;
              },
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop(_nameInput);
          }, child: Text('Confirm'))
        ],
      ),
    );
  }
}



