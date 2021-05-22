import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String elementDetails;

  const SecondPage({Key key, this.elementDetails}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",style: TextStyle(fontSize: 22),),
      ),
      body: Center(
        child: Text(
          widget.elementDetails,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }
}
