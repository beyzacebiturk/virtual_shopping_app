import 'package:flutter/material.dart';
class ItemsUploadScreen extends StatefulWidget {
  const ItemsUploadScreen({super.key});

  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}



class _ItemsUploadScreenState extends State<ItemsUploadScreen>
{
  // upload form screen

  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar:  AppBar(
        title:  const Text(
          "Upload New Item",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
    );

  }
}
