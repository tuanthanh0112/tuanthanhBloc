import 'package:flutter/material.dart';
import 'package:state_management_bloc/data.dart';
import 'package:state_management_bloc/widget/drinkitem.dart';
class DrinkList extends StatelessWidget {
  const DrinkList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final drinks = FakeDataRepository.someFakeDrinksData;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: drinks.length,
      itemBuilder: (context, index) =>
          DrinkItem(drink: drinks[index],
          ),
    );
  }
}