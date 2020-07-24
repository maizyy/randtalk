import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_app/BottomBar.dart';
import 'package:first_app/AddSubject.dart';
import 'dart:math';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyStatefulWidget(),
        '/addSubject': (context) => AddSubjectPage(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final subjects = [
    {
      'title': 'How much do you follow the news?',
      'categories': ['news', 'world']
    },
    {
      'title': 'How concerned about privacy are you?',
      'categories': ['privacy', 'world'],
    },
    {
      'title':
          'What do you think would be the most useful thing you could do with virtual reality?',
      'categories': ['virtual reality', 'world'],
    },
    {
      'title': 'Have you ever tried a dating site or app? How did it go?',
      'categories': ['online datting'],
    },
    {
      'title':
          'Do you think that online / app dating or more traditional ways of dating are better?',
      'categories': ['online datting'],
    },
    {
      'title': 'What gets too much attention in the news?',
      'categories': ['news', 'world']
    },
    {
      'title': 'What teams do you follow?',
      'categories': ['sport', 'world']
    },
    {
      'title': 'Do you play any sports?',
      'categories': ['sport', 'fitness']
    },
    {
      'title': 'How do you like your neighborhood?',
      'categories': ['daily']
    },
    {
      'title': 'What’s the best thing about living in that part of town?',
      'categories': ['daily']
    },
    {
      'title': 'What are your plans for the weekend?',
      'categories': ['daily']
    },
    {
      'title': 'Where are you planning to go for your next vacation?',
      'categories': ['future', 'vacations']
    },
    {
      'title': 'What do you do in your free time?',
      'categories': ['basic']
    },
    {
      'title': 'What do you wish you had more time for?',
      'categories': ['basic']
    },
    {
      'title': 'What’s your favorite album?',
      'categories': ['music']
    },
    {
      'title': 'What type of movies do you like?',
      'categories': ['movies']
    },
    {
      'title': 'What’s your favorite band / singer?',
      'categories': ['music']
    },
    {
      'title': 'What kind of music are you into?',
      'categories': ['music']
    },
    {
      'title': 'Do you like cooking?',
      'categories': ['cooking']
    },
    {
      'title': 'How do you usually find good restaurants?',
      'categories': ['cooking']
    },
    {
      'title': 'Do you like reading books?',
      'categories': ['books']
    },
    {
      'title': 'What’s your favorite book?',
      'categories': ['books']
    },
    {
      'title': 'What types of books do you like?',
      'categories': ['books']
    },
    {
      'title': 'Are there any books you would really recommend I read?',
      'categories': ['books']
    },
    {
      'title': 'What shows do you watch?',
      'categories': ['TV shows']
    },
    {
      'title': 'What are some shows that ended that you were really into?',
      'categories': ['TV shows']
    },
    {
      'title': 'What show do I really need to check out?',
      'categories': ['TV shows']
    },
    {
      'title': 'Where have you been on vacation?',
      'categories': ['vacations', 'world']
    },
    {
      'title': 'Where do you wish you could go on vacation?',
      'categories': ['vacations']
    },
    {
      'title': 'What hobbies did you have when you were younger?',
      'categories': ['hobbies']
    },
    {
      'title': 'Are you a cat person or a dog person?',
      'categories': ['basic']
    },
    {
      'title': 'First milk or cereal?',
      'categories': ['basic']
    },
    {
      'title': 'What good restaurants do you know of around here?',
      'categories': ['cooking', 'basic']
    },
    {
      'title': 'What are some current trends you just can’t get behind?',
      'categories': ['fashion']
    },
    {
      'title': 'What kind of sense of humor do you have?',
      'categories': ['basic']
    },
    {
      'title': 'What are some of your favorite comedies?',
      'categories': ['basic']
    },
    {
      'title': 'Are there any comedians you really like?',
      'categories': ['basic']
    },
    {
      'title': 'What subjects were hardest for you in school?',
      'categories': ['school']
    },
    {
      'title': 'What’s your favorite app on your phone?',
      'categories': ['apps', 'technology']
    },
    {
      'title': 'What app do you wish you didn’t have to use?',
      'categories': ['apps', 'technology']
    },
    {
      'title': 'What app would you suggest everyone get?',
      'categories': ['apps']
    },
    {
      'title': 'What do direction do you think the internet is headed in?',
      'categories': ['technology']
    },
  ];
  final List<Map<String, Object>> buttons = [
    {
      'title': 'Menu',
      'icon': FaIcon(FontAwesomeIcons.bars),
      'reverse': false,
      'route': 'nav',
    },
    {
      'title': 'Add',
      'icon': FaIcon(FontAwesomeIcons.plus),
      'reverse': true,
      'route': '/addSubject',
    }
  ];
  List<Map<String, Object>> filtredSubjects = [];
  bool initClick = false;
  bool endTheme = false;
  void choseRandomSubject() {
    setState(() {
      if (filtredSubjects.isEmpty) {
        endTheme = true;
        _subject = {
          'title': 'You\'ve talked about all questions!!',
          'categories': ['You did it !🔥'],
        };
      } else {
        endTheme = false;
        int r = Random().nextInt(filtredSubjects.length);
        _subject = filtredSubjects.removeAt(r);
      }
    });
    print(filtredSubjects.length);
  }

  String generateCategoriesString(List categories) {
    String res = 'Category: ';
    int len = categories.length;
    for (int i = 0; i < len; i++) {
      if (i == len - 1) {
        res += ' ${categories[i]}';
      } else {
        res += ' ${categories[i]}, ';
      }
    }
    return res;
  }

  Map<String, Object> _subject = {
    'title': 'Hello! Generate a subject to talk about!',
    'categories': ['Make conversation great again!'],
  };

  List<String> allCategories = [];

  void takeAllCategories() {
    allCategories = [];
    for (var subject in subjects) {
      for (String category in subject['categories']) {
        allCategories.add(category);
      }
    }
    setState(() {
      allCategories = allCategories.toSet().toList();
      allCategories.sort();
    });
  }

  void filterSubjects({String param}) {
    filtredSubjects = [];
    if (param == 'all') {
      filtredSubjects = subjects.toList();
    } else {
      for (var subject in subjects) {
        for (var category in subject['categories']) {
          if (category == param) {
            filtredSubjects.add(subject);
            break;
          }
        }
      }
    }
    setState(() {
      initClick = true;
    });
    choseRandomSubject();
    print(filtredSubjects);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    takeAllCategories();
    return Container(
      decoration: endTheme
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.redAccent[100], Colors.white],
              ),
            )
          : BoxDecoration(
              color: Colors.grey[50],
            ),
      child: Scaffold(
        //backgroundColor: endTheme ? Colors.redAccent[100] : Colors.grey[50],
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              ),
              ListTile(
                title: Text(
                  'All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  filterSubjects(
                    param: 'all',
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                child: Divider(
                  color: Colors.redAccent,
                  height: 20,
                  thickness: 2,
                ),
              ),
              ...allCategories.map(
                (category) => ListTile(
                  title: Text(
                      '${category[0].toUpperCase()}${category.substring(1)}'),
                  onTap: () {
                    Navigator.of(context).pop();
                    filterSubjects(
                      param: category,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Pick a random subject to talk about',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                  ),
                ),
                Text(
                  '${_subject['title']}',
                  style: TextStyle(fontSize: 40, fontFamily: 'Lato'),
                ),
                Text(
                  generateCategoriesString(_subject["categories"]),
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(
          scaffoldKey: _scaffoldKey,
          context: context,
          buttons: buttons,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            if (!initClick) {
              filterSubjects(param: 'all');
              initClick = true;
            }
            choseRandomSubject();
          },
          tooltip: 'Give me new subject',
          child: FaIcon(FontAwesomeIcons.exchangeAlt),
          elevation: 2.0,
        ),
      ),
    );
  }
}
