import 'package:equatable/equatable.dart';

abstract class ShopCartEvent extends Equatable{
  const ShopCartEvent();
  @override
  List<Object> get props => [];
}
class AddToCartEvent extends ShopCartEvent{
  final String drinkId;
  const AddToCartEvent(this.drinkId);
}

class RemoveFromCartEvent extends ShopCartEvent{
  final String drinkId;

  const RemoveFromCartEvent(this.drinkId);
}

class CheckOutEvent extends ShopCartEvent{
  const CheckOutEvent();
}