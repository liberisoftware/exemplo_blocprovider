import 'package:bytebank/models/transferencia.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  static Future<Database> getDatabase () async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath,'bytybank.db');

    return openDatabase(
      path,
      onCreate: (db, version) => {
        createSchema(db)
      },
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }

  static void createSchema(Database db) {
    db.execute(
      'CREATE TABLE transfers ('
      ' ID INTEGER PRIMARY KEY, '
      ' CONTA TEXT, '
      ' ACCOUNT REAL, '
      ' DATE TEXT) '
    );
  }

  static Future<int> save(Transferencia registro) async {
    final db = await getDatabase();

    final Map<String, dynamic> registroMap = new Map();
    registroMap["CONTA"] = registro.conta;
    registroMap["ACCOUNT"] = registro.valor;
    registroMap["DATE"] = DateTime.now().toString();

    return db.insert("transfers", registroMap);
  }

  static Future<List<Transferencia>> listAll() async {
    final db = await getDatabase();
    final List<Transferencia> retorno = <Transferencia>[];
    final list = await db.query("transfers");

    for (Map<String,dynamic> item in list) {
      retorno.add(
        new Transferencia(item["ACCOUNT"], int.tryParse(item["CONTA"]))
      );
    }

    return retorno;
  }
}