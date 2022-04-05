// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.symmetric(vertical: 80.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary:Colors.orange
                        ),
                        child: Text('SINAVA BAŞLA'))
                )

              ],
            ),

          ),
        ),
      ),
    );
  }
}