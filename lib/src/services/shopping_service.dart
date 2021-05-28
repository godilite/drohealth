import 'package:drohealth/src/data/repository.dart';
import 'package:drohealth/src/model/item_model.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class ShoppingService with ReactiveServiceMixin {
  RxValue<List<ItemModel>> _shoppingCart =
      RxValue<List<ItemModel>>(initial: []);
  RxValue<int> _itemsCount = RxValue<int>(initial: 0);
  RxValue<ItemModel> _selectedItem = RxValue<ItemModel>(initial: null);
  RxValue<List<ItemModel>> _items = RxValue<List<ItemModel>>(initial: []);
  RxValue<int> _totalCartAmount = RxValue<int>(initial: 0);
  ShoppingService() {
    getItems();
    listenToReactiveValues([_shoppingCart, _items, _itemsCount, _selectedItem]);
  }

  ItemModel get selectedItem => _selectedItem.value;
  List<ItemModel> get shoppingCart => _shoppingCart.value;
  List<ItemModel> get items => _items.value;
  int get cartCount => _itemsCount.value;
  int get totalCartAmount => _totalCartAmount.value;

  ///function adds item to cart list
  void addItemToCart(ItemModel item) {
    _shoppingCart.value.add(item);
    _itemsCount.value = _shoppingCart.value.length;
    calculateTotal();
  }

  void removeItemFromCart(String id) {
    _shoppingCart.value.removeWhere((element) => element.id == id);
    _itemsCount.value = _shoppingCart.value.length;
    calculateTotal();
  }

  void increaseQuantity(String id) {
    ItemModel item =
        _shoppingCart.value.firstWhere((element) => element.id == id);
    item.quantity++;
    item.amount = item.quantity * item.amount;
    calculateTotal();
  }

  void decreaseQuantity(String id) {
    ItemModel item =
        _shoppingCart.value.firstWhere((element) => element.id == id);
    if (item.quantity == 1) return;
    item.amount = (item.amount ~/ item.quantity);

    item.quantity--;
    print(item.amount ~/ item.quantity);
    calculateTotal();
  }

  void getItems() {
    _items.value = repository.drugs;
  }

  void search(String pattern) {
    if (items.isNotEmpty) {
      _items.value = _items.value
          .where((element) =>
              element.drugName.toLowerCase().startsWith(pattern.toLowerCase()))
          .toList();
    }
    if (pattern.isEmpty) getItems();
  }

  void selectIem(item) {
    _selectedItem.value = item;
  }

  void calculateTotal() {
    _totalCartAmount.value = 0;
    if (_shoppingCart.value.isNotEmpty) {
      _shoppingCart.value
          .forEach((element) => _totalCartAmount.value += element.amount);
    } else {
      _totalCartAmount.value = 0;
    }
  }
}
