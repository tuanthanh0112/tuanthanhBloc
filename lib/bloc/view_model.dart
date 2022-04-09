import 'package:bloc/bloc.dart';
import 'package:state_management_bloc/data.dart';
import 'package:state_management_bloc/model/cart.dart';
import 'package:state_management_bloc/bloc/shop_cart_event.dart';
import 'package:collection/collection.dart';

class ViewModel extends Bloc<ShopCartEvent, List<Cart>> {
  final _drinkData = FakeDataRepository.someFakeDrinksData;

  ViewModel():super(<Cart>[]){
    on<AddToCartEvent>(_addItem);
    on<RemoveFromCartEvent>(_removeItem);
    on<CheckOutEvent>(_onCheckOutEvent);
  }



  void _addItem(AddToCartEvent event, Emitter<List<Cart>> emit) {
    List<Cart> newState = List.from(state);

    if (newState.any((cart) => cart.id == event.drinkId)){
      var item = newState.firstWhere((cart) => cart.id == event.drinkId);
      newState[newState.indexOf(item)].quantity += 1;
    }else{
      final selectedCart = _drinkData.firstWhereOrNull((currentCart) =>
      currentCart.id == event.drinkId);
      if (selectedCart == null) return;

      newState.add(
          Cart(id: DateTime.now().toString(), drink: selectedCart,quantity: 1)
      );
    }
    emit(newState);
  }



  void _removeItem(RemoveFromCartEvent event, Emitter<List<Cart>> emit) {
    List<Cart> newState = List.from(state);
    final selectedCart = newState.firstWhere((currentCart) => currentCart.id == event.drinkId);
    if(selectedCart.quantity > 1){
      newState[newState.indexOf(selectedCart)].quantity -= 1;
    }else{
      newState.removeWhere((cart) => cart.id == event.drinkId);
    }
    emit(newState);
  }


  void _onCheckOutEvent(CheckOutEvent event, Emitter<List<Cart>> emit){
    emit([]);
  }


  bool isAdded(String drinkId){
    return state.any((cart) => cart.drink.id == drinkId);
  }

  int getTotalAmount(){
    var total = 0;
    for(var cart in state){
      total += cart.drink.price * cart.quantity;
    }
    return total;
  }
}
