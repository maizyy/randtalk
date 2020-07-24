import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesInput extends StatelessWidget {
  final int index;
  final String cat;
  final List<String> categories;
  final List<String> res;
  final Function remove;
  CategoriesInput({
    Key key,
    this.cat,
    this.categories,
    this.res,
    this.index,
    this.remove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();
    return TextField(
      key: Key(cat),
      onChanged: (val) {
        // print(val);
      },
      decoration: InputDecoration(
        labelText: cat,
        suffixIcon: categories.length != 1
            ? IconButton(
                onPressed: () {
                  remove();
                  print(categories);
                },
                icon: Icon(Icons.delete_outline),
              )
            : null,
      ),
      controller: controller,
      onSubmitted: (val) {
        // print(val);
        // res.add(val);
        // controller.clear();
      },
    );
  }
}
