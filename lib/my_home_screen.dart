import 'package:flutter/material.dart';
import 'package:virtual_shopping_app/home_screen.dart';
import 'package:virtual_shopping_app/inst_login.dart';
import 'package:virtual_shopping_app/items_upload_screen.dart';

// Main class
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State class
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 145, 179),
      appBar: AppBar(
        title: Text('Virtual Shop', style: TextStyle(color: Colors.pink)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_red_eye_rounded, size: 30, color: Colors.white70),
                SizedBox(width: 10),
                Text(
                  'Ürünleri Görüntüle',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                SizedBox(height: 20),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => HomeScreen()));
              },
              child: Text('Görüntüle'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  onPrimary: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, size: 30, color: Colors.white70),
                SizedBox(width: 10),
                Text(
                  'Ürün Yükle',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => InstagramLoginScreen()));
              },
              child: Text('Yükle'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  onPrimary: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}