import 'package:drohealth/src/data/repository.dart';
import 'package:drohealth/src/model/item_model.dart';
import 'package:drohealth/src/services/shopping_service.dart';
import 'package:stacked/stacked.dart';

import '../../../../locator.dart';

class CartViewModel extends ReactiveViewModel {
  ShoppingService _shoppingService = locator<ShoppingService>();
  List<ItemModel> get cartItem => _shoppingService.shoppingCart;
  int get total => _shoppingService.totalCartAmount;
  int get cartCount => _shoppingService.cartCount;

  void increase(String id) {
    _shoppingService.increaseQuantity(id);
    notifyListeners();
  }

  void decrease(String id) {
    _shoppingService.decreaseQuantity(id);
    notifyListeners();
  }

  void delete(String id) {
    _shoppingService.removeItemFromCart(id);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_shoppingService];
}
