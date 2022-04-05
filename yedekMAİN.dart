// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
/*


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinav_uygulamasi/hakkinda.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title:'e-sınav',
      theme:ThemeData(
        primarySwatch:Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' :(context) => MyHomePage(),
        //    '/sorular' :(context) => Sorular(),
        //     '/bitir' :(context) => Bitir(),
        '/hakkinda' :(context) => Hakkinda(),
        //     '/hata' :(context) => Hata(),


      },
    );
  }
}
class MyHomePage extends StatefulWidget{
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String adSoyad='';
  String ogrNo='';

  void kontrol(){
    if((adSoyad.length > 9) && (ogrNo.length == 9)){
      Navigator.pushNamed(context, '/sorular');
    } else {
      Navigator.pushNamed(context, '/hata');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool butonpasif = true;
    if((adSoyad.length > 9) && (ogrNo.length == 9 )){
      butonpasif = false;
    } else {
      butonpasif = true;
    }
    return MaterialApp(

      title: 'Welcome to Flutter',


      home: Scaffold(
        backgroundColor:Colors.black12,
        appBar: AppBar(

          title: const Text(''),
        ),
        body: Center(

          child: Padding(

            padding: const EdgeInsets.all(8.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text("e-sınav",style: TextStyle(fontSize: 70.0,color:Colors.purple)),
                Padding(padding: const EdgeInsets.all(30.0)),
                Text("Adınız ve Soyadınız:"),
                Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          fillColor: Colors.lightBlueAccent, filled:true,
                          border:OutlineInputBorder(),
                          hintText: 'Adınızı ve Soyadınızı giriniz,'
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
                    ),

                  ),
                ),
                Padding(padding:const EdgeInsets.all(20.0)),
                Text("Öğrenci Numaranız:"),
                Padding(
                    padding:const EdgeInsets.all(8.0),
                    child:Container(
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            fillColor: Colors.lightBlueAccent,filled: true,
                            border: OutlineInputBorder(),

                            hintText:'Öğrenci numarasını girin'
                        ),
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary:Colors.orange
                        ),
                        child: Text('SINAVA BAŞLA'))
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Hakkinda()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary:Colors.orange
                        ),
                        child: Text('Hakkında'))
                )
              ],
            ),


          ),
        ),
      ),
    );
  }
}














  //  ____________________________________________


*/