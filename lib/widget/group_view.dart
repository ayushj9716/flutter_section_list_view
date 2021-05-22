import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/contacts_state.dart';

typedef Adapter<T> = String Function(T element);
typedef ClickCallback<T> = void Function(T element);

class GroupView<T> extends StatelessWidget {
  final List<T> elements;
  final Adapter<T> titleAdapter;
  final ClickCallback<T> onItemClicked;
  final Map<String, List<T>> elementsSectionMap;
  final Widget header;
  final Widget footer;

  GroupView._({
    Key key,
    @required this.elements,
    @required this.elementsSectionMap,
    @required this.titleAdapter,
    @required this.onItemClicked,
    this.header,
    this.footer,
  }) : super(key: key);

  factory GroupView({
    @required List<T> elements,
    @required Adapter<T> titleAdapter,
    @required ClickCallback<T> onItemClicked,
    Widget header,
    Widget footer,
  }) {
    final map = _createSectionMap<T>(elements, titleAdapter);
    return GroupView._(
      elements: elements,
      elementsSectionMap: map,
      titleAdapter: titleAdapter,
      onItemClicked: onItemClicked,
      header: header,
      footer: footer,
    );
  }

  //Generate Section Map for Alphabetical Grouping
  static Map<String, List<T>> _createSectionMap<T>(
      List<T> elements, Adapter<T> titleAdapter) {
    Map<String, List<T>> map = new Map();
    for (int i = 0; i < elements.length; i++) {
      if (!map.containsKey(titleAdapter(elements[i]).characters.elementAt(0))) {
        map[titleAdapter(elements[i]).characters.elementAt(0)] = [];
      }
      map[titleAdapter(elements[i]).characters.elementAt(0)].add(elements[i]);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _buildItems(elementsSectionMap, context),
    );
  }

  // Building Sliver Items
  List<Widget> _buildItems(
      Map<String, List<T>> elementsSectionMap, BuildContext context) {
    List<Widget> _widgetList = [];
    _widgetList.add(_buildSearchHeader(context));

    _widgetList.add(SliverToBoxAdapter(
      child: header,
    ));

    for (int i = 0; i < elementsSectionMap.keys.length; i++) {
      _widgetList.add(SliverToBoxAdapter(
        child: _buildSectionHeader(elementsSectionMap.keys.elementAt(i)),
      ));
      _widgetList.add(
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildSectionItem(
                    elementsSectionMap[elementsSectionMap.keys.elementAt(i)]
                        [index]);
              },
              childCount:
                  elementsSectionMap[elementsSectionMap.keys.elementAt(i)]
                      .length,
            ),
            itemExtent: 40),
      );
    }

    _widgetList.add(SliverToBoxAdapter(
      child: footer,
    ));
    return _widgetList;
  }

  // Building Section Header Widget
  _buildSectionHeader(String text) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontSize: 14, color: Colors.black)),
    );
  }

  // Building Section Items Widget
  _buildSectionItem(T element) {
    return InkWell(
      onTap: () {
        onItemClicked(element);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titleAdapter(element),
                style: TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  // Building Search Widget
  Widget _buildSearchHeader(BuildContext context) => SliverAppBar(
        pinned: false,
        snap: true,
        floating: true,
        expandedHeight: 0.0,
        flexibleSpace: Container(
          child: Stack(
            children: [
              Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  top: 10,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    child: Center(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            isCollapsed: true,
                            border: InputBorder.none,
                            hintText: "Search",
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xaa000000),
                            ),
                            hintStyle: TextStyle(color: Color(0xaa000000))),
                        onChanged: (text) {
                          Provider.of<ContactState>(context, listen: false)
                              .searchText = text;
                        },
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
}
