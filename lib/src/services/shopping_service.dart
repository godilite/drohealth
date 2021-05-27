import 'package:drohealth/src/data/repository.dart';
import 'package:drohealth/src/model/item_model.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class ShoppingService with ReactiveServiceMixin {
  RxValue<List<ItemModel>> _shoppingCart =
      RxValue<List<ItemModel>>(initial: []);
  RxValue<ItemModel> _selectedItem = RxValue<ItemModel>(initial: null);
  RxValue<List<ItemModel>> _items = RxValue<List<ItemModel>>(initial: []);

  ShoppingService() {
    getItems();
    listenToReactiveValues([_shoppingCart, _items, _selectedItem]);
  }

  ItemModel get selectedItem => _selectedItem.value;
  List<ItemModel> get shoppingCart => _shoppingCart.value;
  List<ItemModel> get items => _items.value;

  ///function adds item to cart list
  void addItemToCart(ItemModel item) {
    _shoppingCart.value.add(item);
  }

  void removeItemFromCart(String id) {
    _shoppingCart.value.removeWhere((element) => element.id == id);
  }

  void increaseQuantity(String id) {
    ItemModel item =
        _shoppingCart.value.firstWhere((element) => element.id == id);
    item.quantity++;
  }

  void decreaseQuantity(String id) {
    ItemModel item =
        _shoppingCart.value.firstWhere((element) => element.id == id);
    if (item.quantity == 1) return;
    item.quantity--;
  }

  void getItems() {
    _items.value = repository.drugs;
  }

  void search(String pattern) {
    if (items.isNotEmpty) {
      _items.value =
          _items.value.where((element) => element.drugName.startsWith(pattern));
    }
    if (pattern.isEmpty) getItems();
  }
}
