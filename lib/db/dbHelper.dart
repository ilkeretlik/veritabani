import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart'; // eger basında package varsa buu dısardan ekledıgımzı anlamına gelır
import 'dart:async'; //  yokıse kendı ıcınde var anlamına gelır...
import 'dart:io'; // DOSYALARA ULASMAK ICIN
import 'package:veritabani/models/product.dart';

class DbHelper {
  //--------------- bolum standart olarak olusturulur.Burda tablo olusturulur............................
  String tblProduct = "Products"; // tablomuzun ısmı
  String colId = "id";
  String coldescription = "description";
  String colprice = "price";
  String colname = "name";

  static final DbHelper _dbHelper =
      DbHelper._internal(); // final deger alamayacak anlamınagelır
  DbHelper._internal(); // bu tablo parametresız olarak oluturalıbılınır

  factory DbHelper() // factory db helper calıstırır...
  {
    return _dbHelper;
  }

//............................veritabanına ulasılan yer.........................
  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

//............................veritabanına OLUŞTURULAN YER.........................
  Future<Database> initializeDb() async {
    //GET THE PATH TO THE DIRECTORY FOR IOS AND ANDROID TO STORE DB
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "eticaret.db";

    //OPEN/CREATE THE DB AT A GIVEN PATH
    var eticaretDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return eticaretDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tblProduct($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colname TEXT, $coldescription TEXT, $colprice INTEGER)');
  }

//...................crud ıslemlerı....................

//INSERT OPS
  Future<int> urunEkle(Product urun) async {
    Database db = await this.db;
    var result = await db.insert(tblProduct, urun.toMap());
    return result;
  }

  //UPDATE OPS   // int etkılenen kayıt saysıını dondurur
  Future<int> urunGuncelle(Product urun) async {
    Database db = await this.db;
    var result = await db.update(tblProduct, urun.toMap(),
        where: '$colId = ?', whereArgs: [urun.id]);
    return result;
  }

//DELETE OPS
  Future<int> urunSil(int id) async {
    Database db = await this.db;
    int result = await db.delete(tblProduct, where: "$colId = ?", whereArgs: [id]);
    return result;
  }

  //TUM URUNLERI CEK
  Future<List> urunListele() async {
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tblProduct");
    return result;
  }
}
