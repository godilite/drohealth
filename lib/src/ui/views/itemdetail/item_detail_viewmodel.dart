import 'package:drohealth/src/model/item_model.dart';
import 'package:drohealth/src/services/shopping_service.dart';
import 'package:stacked/stacked.dart';

import '../../../../locator.dart';

class ItemDetailViewModel extends ReactiveViewModel {
  ShoppingService _shoppingService = locator<ShoppingService>();
  ItemModel get selectedItem => _shoppingService.selectedItem;
  List<ItemModel> get cartItems => _shoppingService.shoppingCart;
  int get cartCount => _shoppingService.cartCount;
  void addToCart() {
    if (cartItems.contains(selectedItem)) return;
    _shoppingService.addItemToCart(selectedItem);
    notifyListeners();
  }

  void increaseQuantity() {
    selectedItem.quantity++;
    selectedItem.amount = selectedItem.quantity * selectedItem.amount;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (selectedItem.quantity > 1) {
      selectedItem.amount = selectedItem.amount ~/ selectedItem.quantity;

      selectedItem.quantity--;
    }
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_shoppingService];
}
