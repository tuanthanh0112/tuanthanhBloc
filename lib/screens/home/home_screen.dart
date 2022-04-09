import 'package:state_management_bloc/bloc/view_model.dart';
import 'package:state_management_bloc/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:state_management_bloc/widget/badge.dart';
import 'package:state_management_bloc/widget/drink_list.dart';
import 'package:state_management_bloc/screens/cart/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tô Tuấn Thành'),
        centerTitle: true,
        actions:  [
          _buildCartAction(context)
        ],
      ),
      body:  const DrinkList(),
    );
  }

  Widget _buildCartAction(BuildContext context) {
    return BlocBuilder<ViewModel, List<Cart>>(
        builder: (context, vm) {
          return Badge(
            value: vm.length,
            iconButton: IconButton(
              icon: const Icon(Icons.shopping_bag_rounded),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  const CartScreen(),
                  ),
                );
              },
            ),
          );
        }
    );
  }
}