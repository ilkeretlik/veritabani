class Product {
  int _id;
  String _name;
  String _description;
  double _price;

  Product(
      this._name, this._description, this._price); //kayit ekleme constructer
  Product.withId(this._id, this._name, this._description,
      this._price); //guncellme ekleme constructer..sonuna withId eklenir

  int get id => _id; // veritabından id degerine _id yazılacak.
  String get name => _name;
  String get description => _description;
  double get price => _price;

  //set ile kural verilir.kayıt ederr ıken

  set name(String value) {
    if (value.length >= 2) {
      _name = value;
    }
  }

  set price(double value) {
    if (value >= 10) {
      _price = value;
    }
  }

  set description(String value) {
    if (value.length >= 10) {
      _description = value;
    }
  }

// bu verileri flutter kullanabılmek ıcın map yapısı olusturmalıyız..MAP<BURAYE KEY, BURAYA VERİTİPİ EKLENIR> <KEYLER STRİNG OLUR,HERTURLU OLMASI ICIN DINAMIK YAPI EKLENIR >

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["description"] = _description;
    map["price"] = _price;

// id her zaman verilmeyebılınır eger verılırse mape donustur
    if (id != null) {
      map["id"] = _id;
    }

    return map;
  }

  Product.fromObject(dynamic o) {
    this._id = o["id"];
    this._name = o["name"];
    this._description = o["description"];
    this._price =double.tryParse(o["price"].toString()) ;
  }
}
