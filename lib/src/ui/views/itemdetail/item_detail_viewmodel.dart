import 'package:drohealth/src/model/item_model.dart';
import 'package:stacked/stacked.dart';

class ItemDetailViewModel extends ReactiveViewModel {
  ItemModel get selectedItem => ItemModel(
      amount: 2000,
      quantity: 1,
      chemicalName: 'Cefuroxime Axetil.',
      drugName: 'Kezitil Susp.',
      description: 'Oral suspension - 230mg',
      dispensedIn: 'Pack',
      id: 'XHSDFASDJS',
      packSize: '3X7',
      phamarcy: 'Emzor Pharmaceutical',
      imageLink: "https://via.placeholder.com/150");

  void addToCart() {}
  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}
