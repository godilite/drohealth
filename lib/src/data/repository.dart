import 'package:drohealth/src/data/item_provider.dart';
import 'package:drohealth/src/model/item_model.dart';

class Repository {
  final ItemProvider _itemProvider = ItemProvider();

  List<ItemModel> get drugs => _itemProvider.generateDrugsList();
}

final Repository repository = Repository();
