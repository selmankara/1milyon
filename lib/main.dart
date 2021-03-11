import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  String mesaj = 'Merhaba ilk uygulamam';
  @override
  Widget build(BuildContext context) {
    var ogrenciler = [
      'Selman Kara',
      'Merve Çelik',
      'Selim Nil',
      'Mustafa Temizkan',
      'Cafer Dumrul'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: ogrenciler.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(ogrenciler[index]);
                  })),
          Center(
            child: RaisedButton(
              onPressed: () {
                var mesaj = sinavHesapla(15);
                mesajGoster(context, mesaj);
              },
              child: Text('Sonucu Gör'),
            ),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = '';
    if (puan >= 50) {
      mesaj = 'Geçti';
    } else if (puan >= 40) {
      mesaj = 'Bütünleme';
    } else {
      mesaj = 'Kaldı';
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text('Sınav Sonucu'),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
