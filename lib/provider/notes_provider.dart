import 'package:flutter/cupertino.dart';
import 'package:note_app/db/notes_database.dart';

class NotesProvider extends ChangeNotifier{
List<Map<String,dynamic>> arrData=[];

Future<void> addData( String title,String des,) async {
  bool check= await NotesDatabase().addNote(title, des);
  if(check){
    arrData=await NotesDatabase().fatchAllNote();
    notifyListeners();
  } else{
    ('Data not added!!');
  }
}

Future<void> initialData () async {
 arrData=await NotesDatabase().fatchAllNote();
 notifyListeners();
}

Future<void> updateNotes(int id, String tittle, String des) async {

  bool check= await NotesDatabase().updateNotes(id,tittle,des);
  if(check){
    arrData=await NotesDatabase().fatchAllNote();
    notifyListeners();
  } else{
    ('Data not Updated!!');
  }
}

Future<void> deletNotes(int id) async {
  await NotesDatabase().deletNotes(id);
  arrData= await NotesDatabase().fatchAllNote() ;
  notifyListeners();
}

}