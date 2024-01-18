import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:virtual_shopping_app/items_upload_screen.dart';

const backgroundColor = Color.fromARGB(255, 247, 145, 179);
const buttonColor =  Color.fromARGB(255, 246, 212, 224);
const textColor = Colors.pink;

class InstagramLoginScreen extends StatefulWidget {
  @override
  _InstagramLoginScreenState createState() => _InstagramLoginScreenState();
}

class _InstagramLoginScreenState extends State<InstagramLoginScreen> {
  bool isLoggedIn = false;
  String? accessToken;

  Future<void> loginWithInstagram() async {
    try {
      final result = await FlutterWebAuth.authenticate(
        url:
        "https://www.instagram.com/oauth/authorize?client_id=YOUR_CLIENT_ID&redirect_uri=YOUR_REDIRECT_URI&response_type=token&logger_id=6ddbf994-7a4d-44fb-a6a6-c0588d515684",
        callbackUrlScheme: "www.instagram.com",
      );

      accessToken = Uri.parse(result).queryParameters["access_token"];
      setState(() {
        isLoggedIn = false;
      });

      // Instagram girişi başarılı olduğunda items_upload_screen ekranına yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ItemsUploadScreen(),
        ),
      );
    } catch (error) {
      print(error);

      // Instagram girişi başarısız olduğunda error_screen ekranına yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ErrorScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text("Instagram Login", style: TextStyle(color: textColor)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Instagram ile giriş yap",
              style: TextStyle(fontSize: 20, color: textColor),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: loginWithInstagram,
              child: Text("Giriş Yap", style: TextStyle(color: textColor)),
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text("Giriş Başarılı", style: TextStyle(color: textColor)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Instagram girişi başarılı",
              style: TextStyle(fontSize: 20, color: textColor),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ürün yükle butonuna tıklandığında ItemsUploadScreen ekranına yönlendir
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemsUploadScreen(),
                  ),
                );
              },
              child: Text("Ürün Yükle", style: TextStyle(color: textColor)),
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}