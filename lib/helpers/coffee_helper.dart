import 'package:floor/floor.dart';
import 'package:segunda_prova/domain/coffee.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class LivroHelper {
  //singleton
  //construtor interno
  static final LivroHelper _instance = LivroHelper.internal();

  //criação do factory para retornar a instância
  factory LivroHelper() => _instance;

  //LivroHelper.instance
  LivroHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  /*Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) databasesPath = "";
    String path = join(databasesPath, "livros.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE ${Coffee.//}(${Coffee.id} INTEGER PRIMARY KEY , "
                  "                                 ${Coffee.name} TEXT, "
                  "                                 ${Coffee.price} INTEGER, "
                  "                                 ${Coffee.roast} TEXT, "
                  "                                 ${Coffee.sensory} TEXT) ");
        });
  }*/



Future<Database> initDb() async {
  String? databasesPath = await getDatabasesPath();
  if (databasesPath == null) databasesPath = "";
  String path = join(databasesPath, "livros.db");

  return await openDatabase(path, version: 1,
      onCreate: (Database db, int newerVersion) async {git commit -m "first commit"
        await db.execute(
            "CREATE TABLE ${Coffee.tableName}("
                "${Coffee.id} INTEGER PRIMARY KEY, "
                "${Coffee.name} TEXT, "
                "${Coffee.price} REAL, "
                "${Coffee.roast} TEXT, "
                "${Coffee.sensory} TEXT, "
                "${Coffee.region} TEXT) ");
      },
      onConfigure: (Database db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      });
}

  Future<Livro> saveLivro(Livro l) async {
    Database? dbLivro = await db;
    if (dbLivro != null) {
      l.id = await dbLivro.insert(Livro.livroTable, l.toMap());
    }
    return l;
  }

  Future<Livro?> getLivro(int id) async {
    Database? dbLivro = await db;
    if (dbLivro != null) {
      List<Map> maps = await dbLivro.query(Livro.livroTable,
          columns: [
            Livro.idColumn,
            Livro.tituloColumn,
            Livro.autorColumn,
            Livro.anoPublicacaoColumn,
            Livro.avaliacaoColumn
          ],
          where: "${Livro.idColumn} = ?",
          whereArgs: [id]);
      if (maps.length > 0)
        return Livro.fromMap(maps.first);
      else
        return null;
    }
    return null;
  }

  Future<int> deleteLivro(int id) async {
    Database? dbLivro = await db;
    if (dbLivro!= null) {
      return await dbLivro.delete(Livro.livroTable,
          where: "${Livro.idColumn} = ?", whereArgs: [id]);
    } else
      return 0;
  }

  Future<int> updateLivro(Livro l) async {
    Database? dbLivro = await db;
    if (dbLivro != null) {
      return await dbLivro.update(Livro.livroTable, l.toMap(),
          where: "${Livro.idColumn} = ?", whereArgs: [l.id]);
    } else {
      return 0;
    }
  }

  Future<List> getAll() async {
    Database? dbLivro = await db;
    if (dbLivro != null) {
      List listMap = await dbLivro.query(Livro.livroTable);
      List<Livro> listLivros = [];

      for (Map m in listMap) {
        listLivros.add(Livro.fromMap(m));
      }
      return listLivros;
    } else {
      return [];
    }
  }
}