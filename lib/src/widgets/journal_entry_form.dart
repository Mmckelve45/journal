import 'package:flutter/material.dart';
import 'package:journal/export.dart';
// import 'package:journal/src/db/database_manager.dart';

Widget addJournalForm(
    BuildContext context, GlobalKey<FormState> formKey, JournalForm field) {
  // final double padFunc = 10;
  return Scaffold(
      body: 
    SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: fieldInput('Title', field),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: fieldInput('Body', field),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: ratingFieldInput(field),
                ),
                saveButton(context, formKey, field),
              ],
            ),
          )),
    ),
  );
}

Widget fieldInput(String input, JournalForm field) {
  return TextFormField(
    onSaved: (newValue) {
      if (input == 'Title') {
        field.title = newValue;
      } else {
        field.body = newValue;
      }
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please Populate Field';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(labelText: input, border: OutlineInputBorder()),
  );
}

Widget ratingFieldInput(JournalForm field) {
  return DropDownField(
    validate: (fieldInput) {
      if (fieldInput == null) {
        return 'Please enter Rating';
      } else {
        return null;
      }
    },
    onSaved: (value) {
      field.rating = value;
    },
  );
}

Widget saveButton(
    BuildContext context, GlobalKey<FormState> key, JournalForm field) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: 110,
        child: ElevatedButton(
          onPressed: () => {Navigator.pop(context)},
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      SizedBox(
        width: 110,
        child: ElevatedButton(
          onPressed: () {
            field.dateTime = '${DateTime.now()}';
            dbSave(context, key, field);
            // Navigator.of(context).pop();
          },
          child: Text('Save', style: TextStyle(fontSize: 18)),
        ),
      ),
    ],
  );
}
