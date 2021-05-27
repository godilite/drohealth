import 'package:flutter/foundation.dart';

class ItemModel {
  String id;
  String drugName;
  String chemicalName;
  String description;
  String imageLink;
  int amount;
  String phamarcy;
  String packSize;
  String dispensedIn;
  int quantity;
  ItemModel(
      {this.amount,
      this.chemicalName,
      this.description,
      this.drugName,
      this.imageLink,
      @required this.id,
      this.phamarcy,
      this.packSize,
      @required this.quantity,
      this.dispensedIn});
}
