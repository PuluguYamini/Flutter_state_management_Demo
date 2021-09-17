import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './elements.dart';
import './cartscreen.dart';

class HomePage extends StatelessWidget {
  final Categories cat = Get.put(Categories());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('GetX StateManagement HomePage',
          style: TextStyle(fontSize: 20, color: Colors.black)),
      ),
      body: Container(
          child: Column( children: <Widget>[
            const SizedBox(height:20),
              const Text('Products List', textAlign: TextAlign.center,
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
                          child: ListView.builder(
                              itemCount: cat.items.length,
                              itemBuilder: (context, index) {
                                final product = cat.items[index];
                                return Card(
                                    key: ValueKey(product.id),
                                    margin: EdgeInsets.all(5),
                                    color: Colors.white38,
                                    child: ListTile(
                                      title: Text(product.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                      subtitle: Text('\$${product.p1.toStringAsFixed(2)}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                      trailing: Obx(()=> product.tap.value ?
                                  Row( mainAxisSize: MainAxisSize.min,
                                          children:<Widget>[
                                            IconButton(icon: Icon(Icons.remove),
                                              onPressed: () {
                                                if (product.count > 1) {
                                                  cat.dec(product.id);
                                                }
                                                else {
                                                  product.tap.value = false;
                                                  cat.delItem(product.id);
                                                }
                                                print(product.count);
                                              }),
                                            Text('${product.count.toString()}') ,
                                            IconButton(icon: Icon(Icons.add),
                                              onPressed: (){
                                                cat.inc(product.id);
                                                print(product.count);
                                              },),
                                          ]) :
                                      Container( height: 40, width: 100, alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            border: Border.all(color: Colors.white70, width: 1),
                                            borderRadius: BorderRadius.circular(15)),
                                      child: InkWell(
                                        onTap: () {
                                          product.tap.value = true;
                                          if(product.cart.value == false)
                                            cat.addItem(product.id);
                                          else
                                            cat.delItem(product.id);
                                        },
                                        child: Text('Add to cart', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                                      ),
                                    )))
                                );
                              }
                          )))),
                  Expanded( flex: 1, child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(
                              color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: InkWell(
                        child: Container(
                          height: 80, alignment: Alignment.center,  color: Colors.green,
                          child: Obx(() => Text('View Cart>> ${cat.cartitems.length}',  textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20, color: Colors.white))),
                        ),
                        onTap: () => Get.to(CartScreen()),
                      ))),
                      ])
                  ))])
            )));
  }
}


