import 'package:flutter/material.dart';
import 'package:veritabani/db/dbHelper.dart';
import 'package:veritabani/models/product.dart';



class UrunListesi extends StatefulWidget {
  @override
  _UrunListesiState createState() => _UrunListesiState();
}

class _UrunListesiState extends State<UrunListesi> {
  DbHelper dbhelpersinifi = new DbHelper();
  List<Product> urunler;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UrunItems(),
    );
  }

  UrunItems() {
    return ListView.builder(itemBuilder: null);
  }

  void getData() {
    var dbfuture = dbhelpersinifi.initializeDb();
    dbfuture.then((result) {
      // veritabanını aç

      var gelenurunler = dbhelpersinifi.urunListele();
      gelenurunler.then((result) {
        List<Product> productData = new List<Product>();
        count = result.length;
        for (int i = 0; i < count; i++) {

          productData.add(Product);

        }
      });
    });
  }
}
