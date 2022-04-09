import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/view_model.dart';
import 'package:state_management_bloc/model/cart.dart';
import 'package:state_management_bloc/bloc/shop_cart_event.dart';
class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cart}) : super(key: key);
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
      child: ListTile(
        leading: Image.network(
          cart.drink.imageUrl,
        ),
        title: Text(cart.drink.title),
        subtitle: Text('${cart.drink.price * cart.quantity} vnd'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                BlocProvider.of<ViewModel>(context, listen: false).add(RemoveFromCartEvent(cart.id));
              },
              icon: const Icon(Icons.remove_rounded),
            ),
            Text('${cart.quantity}'),
            IconButton(
              onPressed: (){
                BlocProvider.of<ViewModel>(context, listen: false).add(AddToCartEvent(cart.id));
              },
              icon: const Icon(Icons.add_rounded),
            ),
          ],
        ),
      ),
    );
  }
}