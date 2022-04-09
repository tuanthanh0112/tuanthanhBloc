import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/view_model.dart';
import 'package:state_management_bloc/model/cart.dart';
import 'package:state_management_bloc/widget/cart_item.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<ViewModel, List<Cart>>(
        builder: (context, vm) {
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: cartBloc.state.length,
            itemBuilder: (context, index) {
              return CartItem(
                cart: cartBloc.state[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: BlocBuilder<ViewModel, List<Cart>>(
          builder: (context, vm) => Text('${cartBloc.getTotalAmount()} vnd'),

        ),
        icon: const Icon(Icons.monetization_on_sharp),
      ),
    );
  }
}