import 'package:drohealth/src/model/item_model.dart';

class ItemProvider {
  List<ItemModel> generateDrugsList() {
    List<ItemModel> list = [
      ItemModel(
          amount: 2000,
          chemicalName: 'Cefuroxime Axetil.',
          drugName: 'Kezitil Susp.',
          description: 'Oral suspension - 230mg',
          imageLink: "https://via.placeholder.com/150"),
      ItemModel(
          amount: 2000,
          chemicalName: 'Cefuroxime Axetil.',
          drugName: 'Kezitil Susp.',
          description: 'Oral suspension - 230mg',
          imageLink: "https://via.placeholder.com/150")
    ];
    return list;
  }
}
