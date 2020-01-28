import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categories-meal';

  @override
  State<StatefulWidget> createState() {
    return _CategoryMealScreenState();
  }
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayMeal;
  var _isLoadInit = false;
 
  @override
  void didChangeDependencies() {
    if (!_isLoadInit) {
      final routesArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routesArg['id'];
      categoryTitle = routesArg['title'];
      displayMeal = DUMMY_MEAL_VALUE.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
    
    
    }
      _isLoadInit = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
        displayMeal.removeWhere((meal) => meal.id == mealId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeal[index].id,
            title: displayMeal[index].title,
            imageUrl: displayMeal[index].imageUrl,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            affordability: displayMeal[index].affordability,
            removeMeal: _removeMeal,
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
