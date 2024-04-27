import 'package:flutter/material.dart';

/*class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoriesPage(),
    );
  }
}*/

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<String> _categories = [
    'Sport',
    'casual',
    'sweater',
    'shoes',
    'polo shirts',
    'hoodies', // Add a comma here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),

      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 25),
        child: GridView.count(
          crossAxisCount: 2,
          children: _categories.map((category) {
            return Center(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Navigate to $category category');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        category,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
