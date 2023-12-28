import 'package:flutter/material.dart';
class ItemsUploadScreen extends StatefulWidget
{
  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}



class _ItemsUploadScreenState extends State<ItemsUploadScreen>
{
  // upload form screen

  Widget uploadFormScreen()
  {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar:  AppBar(
        backgroundColor: Colors.black54,
        title:  const Text(
          "Upload New Item",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon:  const Icon(
            Icons.arrow_back_rounded,
            color: Colors.pink,
          ),
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context)
  {
    return uploadFormScreen();
  }

}
