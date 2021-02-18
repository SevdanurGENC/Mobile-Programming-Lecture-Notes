import 'package:flutter/material.dart';
import 'package:temel_widget/modules/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudents;
  StudentEdit(Student selectedStudents) {
    this.selectedStudents = selectedStudents;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentEditState(selectedStudents);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  Student selectedStudents;

  var formKey = GlobalKey<FormState>();

  _StudentEditState(Student selectedStudents) {
    this.selectedStudents = selectedStudents;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ogrenci Guncelle"),
        centerTitle: true,
      ),
      // body: Center(
      //   child: Text("Ogrenci Formu Burada Olacak"),
      // ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudents.firstName,
      decoration:
      InputDecoration(labelText: "Ogrencinin Adi : ", hintText: "Sevdanur"),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudents.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudents.lastName,
      decoration:
      InputDecoration(labelText: "Ogrencinin Soyadi : ", hintText: "GENC"),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudents.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudents.grade.toString(),
      decoration:
      InputDecoration(labelText: "Ogrencinin Notu : ", hintText: "100"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudents.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudents.firstName);
    print(selectedStudents.lastName);
    print(selectedStudents.grade);
  }
}
