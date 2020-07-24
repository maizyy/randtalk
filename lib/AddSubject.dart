import 'package:first_app/CategoriesInput.dart';
import 'package:flutter/material.dart';
import 'package:first_app/BottomBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddSubjectPage extends StatefulWidget {
  AddSubjectPage({Key key}) : super(key: key);

  @override
  _AddSubjectPageState createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  final List<Map<String, Object>> buttons = [
    {
      'title': 'Back',
      'icon': FaIcon(FontAwesomeIcons.arrowLeft),
      'reverse': false,
      'route': 'pop',
    },
    {
      'title': 'iduno',
      'icon': FaIcon(FontAwesomeIcons.desktop),
      'reverse': true,
      'route': 'pop',
    }
  ];
  void delete(index) {}

  int cnt = 1;
  List<String> categories = [
    'Category - ' //Item - $index
  ];
  List<String> namedCategories = [];
  @override
  Widget build(BuildContext context) {
    final TextEditingController topicController = new TextEditingController();
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: Column(
                children: <Widget>[
                  Text('Add topic to database'),
                  TextField(
                    controller: topicController,
                    decoration: InputDecoration(
                      labelText: 'Topic',
                      suffixIcon: Transform.rotate(
                        angle: 3.14 / 4,
                        child: IconButton(
                          onPressed: () {
                            topicController.clear();
                          },
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      print('first: ' + val);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, i) {
                          final cat = categories[i] + (i + 1).toString();
                          return CategoriesInput(
                            key: Key(cat),
                            cat: cat,
                            index: i,
                            categories: categories,
                            res: namedCategories,
                            remove: () {
                              setState(() {
                                categories.removeAt(i);
                              });
                            },
                          );
                        }),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        categories.add('Category - ');
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Text('Click to add category'),
                        Icon(Icons.add)
                      ],
                    ),
                  )
                ],
              )),
        ),
        bottomNavigationBar: BottomBar(
          context: context,
          buttons: buttons,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            print(namedCategories);
          },
          tooltip: 'Add new topic',
          child: FaIcon(FontAwesomeIcons.plus),
          elevation: 2.0,
        ),
      ),
    );
  }
}
