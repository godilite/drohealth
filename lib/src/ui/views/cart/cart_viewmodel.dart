import 'package:drohealth/src/data/repository.dart';
import 'package:drohealth/src/model/item_model.dart';
import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  List<ItemModel> get cartItem => repository.drugs;
}
