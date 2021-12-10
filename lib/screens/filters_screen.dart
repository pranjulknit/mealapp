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
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

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
              icon: Icon(Icons.save)),
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
              SwitchListTile(
                  title: Text('Gluten Free'),
                  value: _glutenFree,
                  subtitle: Text('Only include gluten free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('Lactose Free'),
                  value: _lactoseFree,
                  subtitle: Text('Only include Lactose free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegetarian'),
                  value: _vegetarian,
                  subtitle: Text('only include Vegetarian meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegan'),
                  value: _vegan,
                  subtitle: Text('only include Vegan meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ]),
          )
        ],
      ),
    );
  }
}
