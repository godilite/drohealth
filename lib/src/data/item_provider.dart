import 'package:drohealth/src/model/item_model.dart';

class ItemProvider {
  List<ItemModel> generateDrugsList() {
    List<ItemModel> list = [
      ItemModel(
          quantity: 1,
          amount: 2000,
          chemicalName: 'Cefuroxime Axetil.',
          drugName: 'Kezitil Susp.',
          description: 'Oral suspension - 230mg',
          dispensedIn: 'Pack',
          packSize: '6X5',
          id: 'GFGDDSCXD',
          phamarcy: 'Laxim Pharm',
          imageLink: "https://via.placeholder.com/150"),
      ItemModel(
        quantity: 1,
        amount: 1000,
        id: 'kEFDWEXA',
        phamarcy: 'Jossy Pharmacy',
        dispensedIn: 'Pack',
        packSize: '2X5',
        chemicalName: 'Garlic Oil',
        drugName: 'Garlic Oil.',
        description: 'Soft Gel - 650mg',
        imageLink: "https://via.placeholder.com/150",
      ),
      ItemModel(
        quantity: 1,
        amount: 500,
        id: 'FDSFSXA',
        phamarcy: 'Emzor Pharmaceutical',
        dispensedIn: 'Pack',
        packSize: '2X4',
        chemicalName: 'Paral sxzol',
        drugName: 'Paracetamol.',
        description: 'Tablet - 50mg',
        imageLink: "https://via.placeholder.com/150",
      ),
      ItemModel(
        quantity: 1,
        amount: 800,
        id: 'JDFCQSAXS',
        phamarcy: 'Emzor Pharmaceutical',
        dispensedIn: 'Pack',
        packSize: '4X4',
        chemicalName: 'Folic Acid',
        drugName: 'Folic Acid(100)',
        description: 'Tablet - 5mg',
        imageLink: "https://via.placeholder.com/150",
      ),
      ItemModel(
        quantity: 1,
        amount: 800,
        id: 'vCWEQSAXS',
        phamarcy: 'Ibu Pharmaceutical',
        dispensedIn: 'Pack',
        packSize: '4X4',
        chemicalName: 'abacavir sulfate',
        drugName: 'ZIAGEN',
        description: 'Tablet - 5mg',
        imageLink: "https://via.placeholder.com/150",
      ),
      ItemModel(
        quantity: 1,
        amount: 1500,
        id: 'VEWFSAXS',
        phamarcy: 'Ibu Pharmaceutical',
        dispensedIn: 'Pack',
        packSize: '4X4',
        chemicalName: 'abatacept',
        drugName: 'Orencia',
        description: 'Tablet - 5mg',
        imageLink: "https://via.placeholder.com/150",
      ),
    ];
    return list;
  }
}
