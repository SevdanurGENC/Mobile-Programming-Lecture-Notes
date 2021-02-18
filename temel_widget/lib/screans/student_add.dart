import 'package:flutter/material.dart';
import 'package:temel_widget/modules/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;

  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ogrenci Ekle"),
        centerTitle: true,
      ),
      // body: Center(
      //   child: Text("Ogrenci Formu Burada Olacak"),
      // ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        //padding: EdgeInsets.all(20.0),
        //margin: EdgeInsets.only(top : 20.0, right: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
              // TextFormField(
              //   decoration: InputDecoration(
              //       labelText: "Ogrencinin Adi : ", hintText: "Sevdanur"),
              //   validator: validateFirstName,
              //   onSaved: (String value) {
              //     student.firstName = value;
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Ogrencinin Adi : ", hintText: "Sevdanur"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Ogrencinin Soyadi : ", hintText: "GENC"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Ogrencinin Notu : ", hintText: "100"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
