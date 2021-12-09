import 'package:flutter/material.dart';
import 'package:mealapp/widgets/meal_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreeen extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);
  // late final String categoryId;
  // late final String categoryTitle;

  // CategoryMealsScreeen(this.categoryId, this.categoryTitle);
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreeen(this.availableMeals);

  @override
  State<CategoryMealsScreeen> createState() => _CategoryMealsScreeenState();
}

class _CategoryMealsScreeenState extends State<CategoryMealsScreeen> {
  var categoryTitle;
  late List<Meal> displayedMeals;

  var _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
