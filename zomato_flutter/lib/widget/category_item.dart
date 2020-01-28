import 'package:flutter/material.dart';
import '../screen_widget/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
    
  String id;
  String title;
  Color color;
  CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/categories-meal', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.5),
                color,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ));
  }
}
