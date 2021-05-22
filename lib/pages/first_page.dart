import 'package:flutter/material.dart';
import 'package:ikon_app/model/contact_model.dart';
import 'package:ikon_app/pages/second_page.dart';
import 'package:ikon_app/pages/contacts_state.dart';
import 'package:ikon_app/widget/group_view.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactState>(
      create: (_) => ContactState(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Contacts",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Consumer<ContactState>(
          builder: (BuildContext context, value, _) => GroupView<ContactModel>(
            elements: value.displayContacts,
            titleAdapter: (element) => element.name,
            header: _buildHeaderWidget(),
            footer: _buildFooterWidget(),
            onItemClicked: (element) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondPage(elementDetails: element.details)),
              );
              print(element);
            },
          ),
        ),
      ),
    );
  }

  // GroupView<String>(
  // elements: contacts,
  // titleAdapter: (element) => element,
  // header: _buildHeaderWidget(),
  // footer: _buildFooterWidget(),
  // onItemClicked: (element) {
  // Navigator.push(
  // context,
  // MaterialPageRoute(
  // builder: (context) =>
  // SecondPage(elementDetails: element.details)),
  // );
  // print(element);
  // },
  // ),
  _buildHeaderWidget() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Center(
            child: Text(
          "Header",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )));
  }

  _buildFooterWidget() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Center(
            child: Text(
          "Footer",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )));
  }
}
