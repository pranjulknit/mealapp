import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //const FilterScreen({ Key? key }) : super(key: key);
  static const routeName = '/filters';

  final Function saveFilters;

  final Map<String, bool> currenFilters;
  FilterScreen(this.currenFilters, this.saveFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currenFilters['gluten'] as bool;
    _vegetarian = widget.currenFilters['vegetarian'] as bool;

    _vegan = widget.currenFilters['vegan'] as bool;

    _lactoseFree = widget.currenFilters['vegan'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue(currentValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              _buildSwitchListTile(
                  'Gluten-Free', 'only include gluten free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'only include lactose free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'only include Vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'only include Vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ]),
          )
        ],
      ),
    );
  }
}
