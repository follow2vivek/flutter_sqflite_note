import 'package:flutter/material.dart';
import 'package:flutter_sqflite_note/controller/note_controller.dart';
import 'package:flutter_sqflite_note/res/colors.dart';
import 'package:flutter_sqflite_note/res/styles.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNoteScreen extends StatelessWidget {
  final NoteController _noteController = Get.find<NoteController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Note',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _noteController.titleTextController,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
                decoration:
                    styleTextInputDecoration.copyWith(hintText: 'Title'),
                validator: (value) => value.trim().isNotEmpty
                    ? null
                    : 'Please give title to note',
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _noteController.noteTextController,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
                maxLines: 10,
                decoration: styleTextInputDecoration.copyWith(hintText: 'Note'),
                validator: (value) => value.trim().isNotEmpty
                    ? null
                    : 'Please give discription to note',
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) => LinearGradient(
                    colors: [colorPrimary, colorPrimaryDark],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    'Add Note',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    await _noteController.addNote();
                    Get.back();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
