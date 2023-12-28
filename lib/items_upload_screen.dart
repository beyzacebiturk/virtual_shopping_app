import 'dart:typed_data';

import 'package:flutter/material.dart';
class ItemsUploadScreen extends StatefulWidget
{
  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}



class _ItemsUploadScreenState extends State<ItemsUploadScreen>
{
  Uint8List? imageFileUint8List;
  TextEditingController sellerNameTextEditingController=TextEditingController();
  TextEditingController sellerPhoneTextEditingController=TextEditingController();
  TextEditingController itemNameTextEditingController=TextEditingController();
  TextEditingController sellerDescriptionTextEditingController=TextEditingController();
  TextEditingController sellerPriceTextEditingController=TextEditingController();


  bool  isUploading= false;






  // upload form screen

  Widget uploadFormScreen()
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:  AppBar(
        backgroundColor: Colors.black,
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
      body: ListView(
        children: [
          isUploading==true
              ? const LinearProgressIndicator(color: Colors.yellow,)
              : Container(),

          //image
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width*0.8,
            child: Center(
              child: imageFileUint8List!=null?
              Image.memory(
                imageFileUint8List!
              ): const Icon(
                Icons.image_not_supported,
                color: Colors.green,
              ),
            ),
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 2,
          ),


          //satıcı adı
          ListTile (
            leading: const Icon(
              Icons.person_pin_rounded,
              color: Colors.white,
            ),
            title:SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.pinkAccent),
                controller: sellerNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Satıcı Adı",
                  hintStyle:  TextStyle(color: Colors.pinkAccent)
                ),
              ),
            ) ,
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 1,
          )



        ],
      ),
    );

  }
  @override
  Widget build(BuildContext context)
  {
    return uploadFormScreen();
  }

}
