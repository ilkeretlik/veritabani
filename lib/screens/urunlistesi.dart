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
    if (urunler == null) {
      urunler = new List<Product>();
      getData();
    }

    return Scaffold(
      body: urunItems(),
    );
  }

  ListView urunItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.amberAccent,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text("a"),
            ),
            title: Text(this.urunler[position].name),
            subtitle: Text(this.urunler[position].description),
            onTap: () {},
          ),
        );
      },
    );
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
          productData.add(Product.fromObject(result[i]));
        }

        setState(() {
          urunler = productData;
          count = count;
        });
      });
    });
  }
}
