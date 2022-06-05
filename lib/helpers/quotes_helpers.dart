import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/quotes_models.dart';


class DBHelper
{
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  static Database? db;
  final String dbName = 'Flutter.db';
  final String tableName = 'quotes';
  final String colId = 'id';

  Future<Database?> initDB() async {

    String directory =  await getDatabasesPath();
    String path = join(directory , dbName);

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      String query = "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, ${myData[0]} TEXT,${myData[1]} TEXT,${myData[2]} TEXT,${myData[3]} TEXT);";
      await db.execute(query);

    });

    return db;
  }

  Future<int> insertData ({required String cat0,required String cat1,required String cat2,required String cat3}) async {
    db  = await initDB();

       String query = "INSERT INTO $tableName(${myData[0]},${myData[1]},${myData[2]},${myData[3]}) VALUES(?,?,?,?);";

        List args = [cat0,cat1,cat2,cat3];

        return await db!.rawInsert(query,args);

  }

  Future<List<Map<String,dynamic>>> fetchData() async {

    db = await initDB();

    String query = "SELECT * FROM $tableName";

    List<Map<String,dynamic>> data = await db!.rawQuery(query);

    // List<Detail> allData = data.map((e) => Detail.fromMap(e)).toList();

    return data;

  }

  Future<int> deleteAllData() async {

    db = await initDB();

    String query = "DELETE FROM $tableName";

    return await db!.rawDelete(query);

  }
}