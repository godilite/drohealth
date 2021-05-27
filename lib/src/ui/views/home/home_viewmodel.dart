import 'package:drohealth/locator.dart';
import 'package:drohealth/src/constants/route_names.dart';
import 'package:drohealth/src/data/repository.dart';
import 'package:drohealth/src/model/item_model.dart';
import 'package:drohealth/src/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  List<ItemModel> get drugs => repository.drugs;
  List<ItemModel> get cartItem => repository.drugs;

  void openDetail() {
    _navigationService.navigateTo(ItemDetailViewRoute);
  }
}
