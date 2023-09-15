import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  var noteTableName = 'notes';
  var columnNoteID = 'note_id';
  var columnNoteTitle = 'tittle';
  var columnNoteDes = 'des';

  Future<Database> openDB() async {
    var myDirectory = await getApplicationDocumentsDirectory();
    await myDirectory.create(recursive: true);
    var dbPath = "$myDirectory/noteDB.db";
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          "CREATE TABLE notes ( note_id INTEGER PRIMARY KEY AUTOINCREMENT, tittle TEXT, des TEXT )");
    });
  }

  Future<bool> addNote(String title, String des,) async {
    var dbRef = await openDB();
    var check = await dbRef.insert(noteTableName, {
      columnNoteTitle: title,
      columnNoteDes: des,
    });
    return check > 0;
  }

  Future<List<Map<String, dynamic>>> fatchAllNote() async {
    var dbRef = await openDB();
    List<Map<String, dynamic>> notes = await dbRef.query(noteTableName);
    return notes;
  }

  Future<bool> updateNotes(int id, String tittle, String des) async {
    var dbRef = await openDB();
    var check = await dbRef.update(
        noteTableName,
        {
          columnNoteTitle: tittle,
          columnNoteDes: des,
        },
        where: "$columnNoteID = '$id'");
    return check > 0;
  }

  Future<void> deletNotes(int id) async {
    var dbRef = await openDB();
    dbRef.delete(noteTableName, where: '$columnNoteID = ?', whereArgs: ['$id']);
  }
}
