import 'package:flutter/material.dart';
import 'package:virtual_shopping_app/home_screen.dart';
import 'package:virtual_shopping_app/items_upload_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 212, 224),
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
                Icon(Icons.remove_red_eye_rounded, size: 30),
                SizedBox(width: 10),
                Text(
                  'Ürünleri Görüntüle',
                  style: TextStyle(fontSize: 20),
                ),  // Added missing closing parenthesis here
                SizedBox(height: 20),  // Moved inside the Row
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
            Row( // Added Row for icon and text
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, size: 30), // Added icon
                SizedBox(width: 10),
                Text(
                  'Ürün Yükle',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => ItemsUploadScreen()));
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