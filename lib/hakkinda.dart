// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:navigator/navigator.dart';
import 'package:sinav_uygulamasi/main.dart';

class Hakkinda extends StatefulWidget{
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: Text('Hakkında'),
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bu uygulama Cemile Nur Demir tarafından yazılmıştır'),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Anasayfaya Dön'),
                ),
              )
            ],
          )

        ),
      ),
    );
  }
}
