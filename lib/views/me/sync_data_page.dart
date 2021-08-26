import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/db/db_util.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:sqflite/sqflite.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({this.model, this.editable});
  final Doc model;
  final bool editable;

  @override
  SyncDataPageState createState() => SyncDataPageState();
}

class SyncDataPageState extends State<SyncDataPage> {
  ShapeBorder _shape;
  DocDetail detail;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initDb();
    });
  }

  _initDb() async {
    Database database = await DbUtil().db;

    // Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert('INSERT INTO yq_repo(name) VALUES("some name")');
      print('inserted1: $id1');

      int id2 = await txn.rawInsert(
          'INSERT INTO yq_repo(name, type, slug) VALUES(?, ?, ?)',
          ['another name', 'type', 'slug']);
      print('inserted2: $id2');
    });

    // Update some record
    int count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM yq_repo'));
    print('query: $count');

    await database.close();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MeAppBar(
        title: const Text('数据同步'),
      ),
      body: SafeArea(
        child: Gaps.empty,
      ),
    );
  }
}
