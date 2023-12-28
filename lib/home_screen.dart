import 'package:flutter/material.dart';
import 'package:virtual_shopping_app/items_upload_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Virtual Shop", //burayı değiştirip marka adı koyulacak

            style: TextStyle(

              fontSize: 18,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.pink,

            )
            ),
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsUploadScreen ()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.pink,
            ),
          )
        ],
      ),
    );
  }
}
