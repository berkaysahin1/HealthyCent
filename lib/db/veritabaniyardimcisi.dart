import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{
  static final String veritabaniAdi="healthycent.sqlite";

  static Future<Database> veritabaniErisim() async{
    String veritabaniYolu=join(await getDatabasesPath(),veritabaniAdi);
    // if (await databaseExists(veritabaniYolu)){
    //   print("veritabanı bağlı");
    // }else{
    ByteData data=await rootBundle.load("veritabani/healthycent.sqlite");
    List<int> bytes=data.buffer.asInt8List(data.offsetInBytes,data.lengthInBytes);
    await File(veritabaniYolu).writeAsBytes(bytes,flush: true);

    // }


    return openDatabase(veritabaniYolu);
  }
}