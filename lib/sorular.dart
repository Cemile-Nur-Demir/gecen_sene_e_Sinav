// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/routes.dart';
import 'dart:async';
import 'package:sinav_uygulamasi/bitir.dart';


class Sorular extends StatefulWidget{
  _SorularState createState() => _SorularState();
}

String zamaniFormatla(int milisaniye){
  var saniye = milisaniye ~/ 1000;
  var dakika = ((saniye % 3600) ~/ 60).toString().padLeft(2,'0');
  var saniyeler = (saniye % 60).toString().padLeft(2, '0');
  return "$dakika:$saniyeler";
}


class _SorularState extends State<Sorular> {
  String? adSoyad = '';
  String? ogrNo = '';

  int mevcutsoru = 0;
  String mevcutcevap = '';
  int puan = 0;
  int kullanilansure = 0;

  var _sayac = Stopwatch();
  var _timer = Timer(Duration(seconds:10),() => print('zamanın doldu'));

  void initState(){
    super.initState();
    this._sayac = Stopwatch();
    this._timer = new Timer.periodic(new Duration(seconds:1), (timer) {
      setState(() {

      });
    });

    mevcutsoru = 0;
    mevcutcevap = '';
    puan = 0;
    kullanilansure = 0;

  }

  void dispose(){
    _timer.cancel();
    super.dispose();
  }


  void BitireYolla(){
    var data = [];
    data.add(adSoyad);
    data.add(ogrNo);
    data.add(puan.toString());
    data.add(zamaniFormatla(kullanilansure));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bitir(),
          settings:  RouteSettings(
            arguments: data,
          ),
        ));
  }


  var sorular = [
    {
      'soru': 'Fatih Sultan Mehmet\'in babası kimdir?',
      'cevaplar': ['I. Mehmet', 'II. Murat', 'Yıldırım Beyazıt'],
      'dogrucevap': 'II. Murat'
    },
    {
      'soru': 'Hangi yabancı futbolcu Fenerbahçe forması giymiştir?',
      'cevaplar': ['Simoviç', 'Schumacher', 'Prekazi'],
      'dogrucevap': 'Schumacher'
    },
    {
      'soru': 'Magna Carta hangi ülkenin kralıyla yapılmış bir sözleşmedir?',
      'cevaplar': ['İngiltere', 'Fransa', 'İspanya'],
      'dogrucevap': 'İngiltere'
    },
    {
      'soru': 'Hangisi tarihteki Türk devletlerinden biri değildir?',
      'cevaplar': ['Avar Kağanlığı', 'Emevi Devleti', 'Hun İmparatorluğu'],
      'dogrucevap': 'Emevi Devleti'
    },
    {
      'soru': 'Hangi ülke Asya kıtasındadır?',
      'cevaplar': ['Madagaskar', 'Peru', 'Singapur'],
      'dogrucevap': 'Singapur'
    },
    {
      'soru':
      'ABD başkanlarından John Fitzgerald Kennedy’e suikast düzenleyerek öldüren kimdir?',
      'cevaplar': ['Lee Harvey Oswald', 'Clay Shaw', 'Jack Ruby'],
      'dogrucevap': 'Lee Harvey Oswald'
    },
    {
      'soru':
      'Aşağıdaki hangi Anadolu takımı Türkiye Süper Liginde şampiyon olmuştur?',
      'cevaplar': ['Kocaelispor', 'Bursaspor', 'Eskişehirspor'],
      'dogrucevap': 'Bursaspor'
    },
    {
      'soru': 'Hangisi Kanuni Sultan Süleyman’ın eşidir?',
      'cevaplar': ['Safiye Sultan', 'Kösem Sultan', 'Hürrem Sultan'],
      'dogrucevap': 'Hürrem Sultan'
    },
    {
      'soru': 'Hangi hayvan memeli değildir?',
      'cevaplar': ['Penguen', 'Yunus', 'Yarasa'],
      'dogrucevap': 'Penguen'
    },
    {
      'soru': 'Osmanlı’da Lale devri hangi padişah döneminde yaşamıştır?',
      'cevaplar': ['III. Ahmet', 'IV. Murat', 'III. Selim'],
      'dogrucevap': 'III. Ahmet'
    },
  ];

  void kontrolEt(){
    if(mevcutsoru > 8){
      mevcutsoru=0;
      _timer.cancel();
      BitireYolla();
    } else {
      if(mevcutcevap == sorular[mevcutsoru]['dogrucevap']){
        puan = puan +10;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      } else {
        puan = puan - 10;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    List? data = [];
    data = ModalRoute.of(context)?.settings.arguments as List;
    adSoyad = data[0];
    ogrNo = data[1];

    _sayac.start();
    if(_sayac.elapsedMilliseconds > 9999 && mevcutsoru <9){  //SORU ARTTIRIRKEN BURAYIDA ARTTIR
      kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
      _sayac.reset();   // 10 saniyede cevap verilmezse diğer soruya geçiyor
      mevcutsoru++;
    }

    if(mevcutsoru == 9 && _sayac.elapsedMilliseconds > 9999){
      Future.delayed(Duration.zero, () async {
        _sayac.reset(); //Sıfırlama
        _sayac.stop();  // Bitiş ekranına geldik
        _timer.cancel(); // yeni ekrana geçtiğimizde saymayı bitirsin
        mevcutsoru = 0;
        BitireYolla();
      }
      );
    }



    List cevapListesi = [];

      (sorular[mevcutsoru]['cevaplar'] as List).forEach((element) {
        cevapListesi.add(element);
      });


    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("e-sınav",style: TextStyle(fontSize: 70.0,color:Colors.purple)),
            Text('Ad Soyad:' + adSoyad!),
            Text('Öğrenci Numarası:' + ogrNo!),
            Text('Mevcut Soru/ Toplam Soru:' + mevcutsoru.toString() ),
            Text('Puan: ' + puan.toString()),
            Text(sorular[mevcutsoru]['soru'].toString(), textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevapListesi[0].toString();
                  });
                  kontrolEt();
                },
                child: Text(
                  cevapListesi[0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevapListesi[1].toString();
                  });
                  kontrolEt();
                },
                child: Text(cevapListesi[1]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    mevcutcevap = cevapListesi[2].toString();
                  });
                  kontrolEt();
                },
                child: Text(cevapListesi[2]),
              ),
            ),
            Text(zamaniFormatla(_sayac.elapsedMilliseconds)),
            Text('Kullanılan Süre: ' + zamaniFormatla(kullanilansure)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Anasayfaya Dön'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



