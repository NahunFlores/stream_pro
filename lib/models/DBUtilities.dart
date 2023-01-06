
import 'package:sqflite/sqflite.dart';

class DBUtilities{
  static Database? _database;

  static Database? getDB(){
    return _database;
  }

  initDB() async {
    _database = await openDatabase(
        "streamProDB.db",
        version: 1,
        onCreate: (Database db, int version){
          _database?.execute("CREATE TABLE clientes ("
              "id_clientes INTEGER PRIMARY KEY,"
              "nombre VARCHAR(50),"
              "pais VARCHAR(30),"
              "telefono VARCHAR(20),"
              "correo_electronico VARCHAR(100)"
              ")"
          );
          _database?.execute("CREATE TABLE proveedores ("
              "id_proveedor INTEGER PRIMARY KEY,"
              "nombre VARCHAR(50),"
              "pais VARCHAR(30),"
              "telefono VARCHAR(20)"
              ")"
          );
          _database?.execute("CREATE TABLE usuarios ("
              "id_usuario INTEGER PRIMARY KEY,"
              "displayname VARCHAR(50),"
              "correo_electronico VARCHAR(100),"
              "contrasenia VARCHAR(50),"
              "telefono VARCHAR(20),"
              "direccion TEXT"
              ")"
          );
          _database?.execute("CREATE TABLE cuentas ("+
              "id_cuentas INTEGER PRIMARY KEY,"
              "correo_electronico VARCHAR(100),"
              "contrasenia VARCHAR(50),"
              "fecha_compra DATE,"
              "fecha_venta DATE,"
              "plataforma VARCHAR(20),"
              "membresia VARCHAR(100):"
              "patallas INTEGER,"
              "precio DECIMAL(6,2),"
              "pagado BOOLEAN"
              ");"
          );
        },
        onDowngrade: (db, oldVersion, newVersion) {

        },
    );
  }


}