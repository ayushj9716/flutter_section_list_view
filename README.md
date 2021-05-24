# flutter SectionListView

An Application to demonstrate section list view with Contact list like IOS.
```bash
GroupView<Type>(
   elements: List<Type>,
   titleAdapter: (element) => element.title,
   header: _buildHeaderWidget(),
   footer: _buildFooterWidget(),
   onItemClicked: (element) {
      print(element);
   },
  )
```
## Screenshots
<img src="https://github.com/ayushj9716/flutter_section_list_view/blob/main/ScreenShots1.png" width="200" />,
<img src="https://github.com/ayushj9716/flutter_section_list_view/blob/main/ScreenShots2.png" width="200" />,
<img src="https://github.com/ayushj9716/flutter_section_list_view/blob/main/ScreenShots3.png" width="200" />



### Why Scroll to Index in not straightforward?
This App used CustomScrollView with slivers. It has sliver app bar (Search bar) with optional header and footer widgets.

- **Input is List**: Input Data is provided in list format. Grouping the list according to their titles and adding sections headers has to be considered while making scroll to index in list.


- **Approach to build widget**. I have created a Map of list with First alphabet as the key and corresponding elements as their values in a list format. For each header `SliverToBoxAdapter` has been used and `SliverFixedExtentList` for all of his children which loads all of them at once as a seperate list. Because of this hierarchical structure(Nested Lists) of sections. It is difficult to scroll to a specific position.  



### Approach and Architecture of the App.
This app uses a GroupView Widget to create a sectioned list with Grouped by their titles using providers as state management. 

**GroupView** is Stateless widget with `CustomScrollView` and `Slivers` containing search bar, header and footer with section list of titles provided by user.

**contact_state** is the `ChangeNotifier` holding the state of the GroupView widget. GroupView Widget doesn't have any state except the Search text. I would have preferred search bar outside the widget but the requirement was that GroupView must contain search functionality.


- **Approach to build widget**. I have created a Map of list with First alphabet as the key and corresponding elements as their values in a list format. For each header **SliverToBoxAdapter** has been used and **SliverFixedExtentList** for all of his children which loads all of them at once as a seperate list. Because of this hierarchical structure(Nested Lists) of sections. It is difficult to scroll to a specific position.  

    
- **Header is optional**: This has to be checked if header is provided or not while scrolling to index.


