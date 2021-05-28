import 'package:drohealth/locator.dart';
import 'package:drohealth/src/constants/route_names.dart';
import 'package:drohealth/src/model/item_model.dart';
import 'package:drohealth/src/services/navigation_service.dart';
import 'package:drohealth/src/services/shopping_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  ShoppingService _shoppingService = locator<ShoppingService>();
  List<ItemModel> get drugs => _shoppingService.items;
  int get cartCount => _shoppingService.cartCount;
  bool _searchOpen = false;
  bool get searchOpen => _searchOpen;

  //open item details page
  void openDetail(ItemModel item) {
    _shoppingService.selectIem(item);
    _navigationService.navigateTo(ItemDetailViewRoute);
  }

  void onSearch(String pattern) {
    _shoppingService.search(pattern);
  }

  void toggleSearch() {
    if (searchOpen) onSearch('');
    _searchOpen = !_searchOpen;
    notifyListeners();
  }

  void sortAlphabetically() {
    drugs.sort((a, b) {
      return a.drugName.toLowerCase().compareTo(b.drugName.toLowerCase());
    });
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_shoppingService];
}
