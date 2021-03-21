import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String titleMesaj = 'Öğrenci Takip Sistemi';

  Student seciliOgrenci = Student.withId(0, '', '', 0);

  List<Student> students = [
    Student.withId(1, 'Selman', 'Kara', 25),
    Student.withId(2, 'Merve', 'Çelik', 65),
    Student.withId(3, 'Selim', 'Nil', 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titleMesaj),
        ),
        body: buildBody(context));
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text('İşlem Sonucu'),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.cozumpark.com/wp-content/uploads/avatars/20089/5d15fd5053a62-bpfull.jpg'),
                    ),
                    title: Text(students[index].firstName +
                        ' ' +
                        students[index].lastName),
                    subtitle: Text('Sınav Puanı: ' +
                        students[index].grade.toString() +
                        ' [' +
                        students[index].getStatus +
                        ']'),
                    trailing: ikon(students[index].grade),
                    onTap: () {
                      print(seciliOgrenci);
                      setState(() {
                        seciliOgrenci = students[index];
                      });
                    },
                  );
                })),
        Text('Seçili Öğrenci: ' + seciliOgrenci.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentAdd(students),
                    ),
                  ).then((value) => setState(() {}));
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text('Yeni Kayıt'),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentEdit(seciliOgrenci)))
                      .then((value) => setState(() {}));
                },
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5),
                    Text('Güncelle'),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                onPressed: () {
                  setState(() {
                    students.remove(seciliOgrenci);
                  });
                  var mesaj = 'Silindi: ' + seciliOgrenci.firstName;
                  mesajGoster(context, mesaj);
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    Text('Kaydı Sil'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ikon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
