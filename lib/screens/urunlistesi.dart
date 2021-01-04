import 'package:flutter/material.dart';
import 'package:veritabani/db/dbHelper.dart';
import 'package:veritabani/models/product.dart';

class UrunListesi extends StatefulWidget {
  @override
  _UrunListesiState createState() => _UrunListesiState();
}

class _UrunListesiState extends State<UrunListesi> {
DbHelper dbhelpersinifi = new DbHelper();
List<Product> urunler ;
int count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body:UrunItems(),

    );
  }

  UrunItems() {
return ListView.builder(
  
  itemBuilder: null);

  }



}