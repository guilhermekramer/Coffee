import 'package:segunda_prova/domain/coffee.dart'; 
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CoffeeHelper {
  //singleton
  //construtor interno
  static final CoffeeHelper _instance = CoffeeHelper.internal(); 

  //criação do factory para retornar a instância
  factory CoffeeHelper() => _instance;

  //LivroHelper.instance
  CoffeeHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
      print("deu certo criar o banco");
    return _db;
  }

  Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) databasesPath = "";
    String path = join(databasesPath, "livros.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE ${Coffee.tableName}(${Coffee.idValue} INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "                                 ${Coffee.coffeeValue} TEXT, "
                  "                                 ${Coffee.priceValue} REAL, "
                  "                                 ${Coffee.roastValue} TEXT, "
                  "                                 ${Coffee.sensoryValue} TEXT, "
                  "                                 ${Coffee.regionValue} TEXT) ");
        });

        
  }

  Future<Coffee> saveCoffee(Coffee e) async {
    Database? dbCoffee = await db;
    if (dbCoffee != null) {
      await dbCoffee.insert(Coffee.tableName, e.toMap());
      print("salvou legal no banco o café");
    }
    return e;
  }

  Future<Coffee?> getCoffee(int id) async {
    Database? dbLivro = await db;
    if (dbLivro != null) {
      List<Map> maps = await dbLivro.query(Coffee.tableName,
          columns: [
            Coffee.idValue,
            Coffee.coffeeValue,
            Coffee.priceValue,
            Coffee.roastValue,
            Coffee.sensoryValue,
            Coffee.regionValue
          ],
          where: "${Coffee.idValue} = ?",
          whereArgs: [id]);
      if (maps.isNotEmpty) {
        return Coffee.fromMap(maps.first); 
      } else {
        return null;
      }
    }
    return null;
  }

  
  Future<int> deleteCoffee(int id) async {
    Database? dbCoffee = await db;
    if (dbCoffee!= null) {
      return await dbCoffee.delete(Coffee.tableName,
          where: "${Coffee.idValue} = ?", whereArgs: [id]);
    } else {
      return 0;
    }
  }


 Future<int> updateCoffee(Coffee e) async {
  Database? dbCoffee = await db;
  if (dbCoffee != null) {
    return await dbCoffee.update(
      Coffee.tableName,
      e.toMap(),
      where: "${Coffee.idValue} = ?",
      whereArgs: [e.id],
    );
  } else {
    return 0;
  }
}


Future<List<Coffee>> getAll() async {
  Database? dbCoffee = await db;
  if (dbCoffee != null) {
    List<Map<String, dynamic>> listMap = await dbCoffee.query(Coffee.tableName);
    List<Coffee> listCoffees = [];

    for (Map<String, dynamic> m in listMap) {
      listCoffees.add(Coffee.fromMap(m));
    }
    return listCoffees;
  } else {
    return [];
  }
}

}