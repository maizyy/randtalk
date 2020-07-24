import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BuildContext context;
  final List<Map<String, Object>> buttons;
  BottomBar({
    Key key,
    this.scaffoldKey,
    this.context,
    this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ...buttons.map((button) {
                return BottomAppBarButton(
                  scaffoldKey: scaffoldKey,
                  icon: button['icon'],
                  text: button['title'],
                  reverse: button['reverse'],
                  route: button['route'],
                );
              }),
            ],
          ),
        ),
      ),
      shape: CircularNotchedRectangle(),
    );
  }
}

class BottomAppBarButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final FaIcon icon;
  final String text;
  final bool reverse;
  final String route;
  final BuildContext context;
  BottomAppBarButton({
    Key key,
    this.scaffoldKey,
    this.icon,
    this.text,
    this.reverse = false,
    this.route,
    this.context,
  });

  Widget rev(bool reverse) {
    if (!reverse) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: icon,
          ),
          Text(
            '$text',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$text',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: icon,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        switch (route) {
          case 'pop':
            {
              print('przycisk na pop');
              Navigator.pop(context);
              break;
            }
          case 'nav':
            {
              if (scaffoldKey?.currentState != null) {
                scaffoldKey.currentState.openDrawer();
                print('otwierasz drawer');
              }
              break;
            }
          default:
            {
              Navigator.pushNamed(context, route);
              print(route);
              break;
            }
        }
      },
      child: rev(reverse),
    );
  }
}
