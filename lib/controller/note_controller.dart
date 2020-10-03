import 'package:flutter/material.dart';
import 'package:flutter_sqflite_note/db/db_helper.dart';
import 'package:flutter_sqflite_note/model/note_model.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  /* this function will be called as soon as you 
  navigate to screen */
  @override
  void onReady() {
    getNotes();
    super.onReady();
  }

  //this will hold the data and update the ui
  final noteModelList = List<NoteModel>().obs;

  // To get the text from textformfield widget
  TextEditingController titleTextController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();

  // add data to table
  Future<void> addNote() async => await DBHelper.insert(NoteModel(
      note: noteTextController.text, title: titleTextController.text));

  // get all the data from table
  void getNotes() async {
    // clear the text of textfield
    titleTextController.text = '';
    noteTextController.text = '';

    List<Map<String, dynamic>> noteList = await DBHelper.query();
    noteModelList.value =
        noteList.map((data) => new NoteModel.fromJson(data)).toList();
  }

  // delete data from table
  void deleteNote(NoteModel noteModel) async {
    await DBHelper.delete(noteModel);
    getNotes();
  }
}
