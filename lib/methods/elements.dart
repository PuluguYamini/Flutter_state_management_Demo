import 'package:get/get.dart';
import 'dart:math';

class ItemList {
  String name;
  double p1;
  int id;
  RxBool cart;
  RxInt count;
  RxBool tap = false.obs;
  ItemList({required this.name, required this.p1, required this.id, required this.cart, required this.count});
}

final List<String> namelist = [
  'Tomato (1KG)',
  'Onion (1KG)',
  'Carrot (1KG)',
  'BeetRoot (1KG)',
  'Capsicum (1KG)',
  'Potato (1KG)',
  'Strawberry(1KG)',
  'Orange (10Pcs)',
  'Banana (8Pcs)',
  'Watermelon(1KG)',
  'Apple (1KG)',
  'Pineapple (1KG)'
];

class Categories extends GetxController {
  RxList<ItemList> items = List.generate(namelist.length, (index) =>
      ItemList(name: namelist[index], p1: Random().nextDouble()*100, id: index, count: 1.obs, cart: false.obs)).obs;

  List<ItemList> get values { return [...items];}

  List<ItemList> get cartitems {return items.where((element) => element.cart.value == true).toList();}

  void addItem(int id){
    final int index = items.indexWhere((element) => element.id == id);
    items[index].cart.value = true;

  }

  void delItem(int id){
    final int index = items.indexWhere((element) => element.id == id);
    items[index].cart.value = false;
  }

  void inc(int id) {
    final int index = items.indexWhere((element) => element.id == id);
    items[index].count++;
  }

  void dec(int id) {
    final int index = items.indexWhere((element) => element.id == id);
    items[index].count--;
  }

}
