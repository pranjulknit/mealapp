import 'package:flutter/material.dart';
import 'package:mealapp/widgets/category_item.dart';
import 'package:mealapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen extends({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id, catData.title, catData.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
