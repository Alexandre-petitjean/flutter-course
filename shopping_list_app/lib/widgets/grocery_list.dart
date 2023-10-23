import 'package:flutter/material.dart';

import '../data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
            leading: Container(
              color: groceryItems[index].category.color,
              width: 24,
              height: 24,
            ),
            trailing: Text(
                groceryItems[index].quantity.toString(),
            ),
            title: Text(
              groceryItems[index].name,
            ),
          ),
      ),
    );
  }
}
