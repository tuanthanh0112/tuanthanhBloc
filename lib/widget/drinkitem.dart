import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/shop_cart_event.dart';
import 'package:state_management_bloc/bloc/view_model.dart';
import 'package:state_management_bloc/model/cart.dart';
import 'package:state_management_bloc/model/drink.dart';


class DrinkItem extends StatelessWidget {
  const DrinkItem(
      {Key? key,
        required this.drink,
       })
      : super(key: key);
  final Drink drink;

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<ViewModel>(context, listen: false);
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Image.network(
            drink.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: _buildFooter(drink, context, cartBloc),
        ),
      ),
    );
  }

  Widget _buildFooter(Drink drink, BuildContext context,ViewModel cartBloc) {
    return GridTileBar(
      backgroundColor: Colors.black38,
      title: Text(drink.title),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          '${drink.price} vnd',
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
      ),
      trailing:  BlocBuilder<ViewModel, List<Cart>>(
        builder: (context, state) {
          return cartBloc.isAdded(drink.id)
              ? IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () => cartBloc.add(RemoveFromCartEvent(drink.id)),
          )
              : IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => cartBloc.add(AddToCartEvent(drink.id)),
          );
        },
      ),
    );
  }
}