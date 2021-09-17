import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './elements.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {

  final Categories cat = Get.find<Categories>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('GetX StateManagement CartPage',
            style: TextStyle(fontSize: 20, color: Colors.black)),
      ),
      body: Container(
        child: Column( children: <Widget>[
          const SizedBox(height:20),
          const Text('Cart', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height:20),
          Expanded(child: Container( alignment: Alignment.topCenter, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              child: Column( children: <Widget>[
                Expanded(flex: 5, child: Container(padding: EdgeInsets.all(10), margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(
                        child: Obx(() => ListView.builder(
                            itemCount: cat.cartitems.length,
                            itemBuilder: (context, index) {
                              final item = cat.cartitems[index];
                              return Card(
                                key: ValueKey(item.id),
                                margin: EdgeInsets.all(5),
                                color: Colors.white38,
                                child: ListTile(
                                  leading: IconButton(
                                      onPressed: () {
                                        item.tap.value = false;
                                        item.cart.value = false;
                                        cat.delItem(item.id);
                                      },
                                      icon: Icon(Icons.delete, color: Colors.red)),
                                    title: Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                    subtitle: Text(item.p1.toStringAsFixed(2), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                  trailing: Text('Quantity: ${item.count.toString()}', textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                ));
                            })))))
              ])))
        ]))));
  }
}
