import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtual_shopping_app/api_consumer.dart';
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
  TextEditingController itemDescriptionTextEditingController=TextEditingController();
  TextEditingController itemPriceTextEditingController=TextEditingController();


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
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                onPressed:()
                    {

                    },
                icon: const Icon(
                Icons.cloud_upload,
                color: Colors.white,
    )


            ),
          ),

        ],
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
          ),


          //satıcı telefonu
          ListTile (
            leading: const Icon(
              Icons.phone_iphone_rounded,
              color: Colors.white,
            ),
            title:SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.pinkAccent),
                controller: sellerPhoneTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Satıcı Telefonu",
                    hintStyle:  TextStyle(color: Colors.pinkAccent)
                ),
              ),
            ) ,
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 1,
          ),


          //ürün adı
          ListTile (
            leading: const Icon(
              Icons.title,
              color: Colors.white,
            ),
            title:SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.pinkAccent),
                controller: itemNameTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Ürün Adı",
                    hintStyle:  TextStyle(color: Colors.pinkAccent)
                ),
              ),
            ) ,
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 1,
          ),


          //ürün açıklaması
          ListTile (
            leading: const Icon(
              Icons.description,
              color: Colors.white,
            ),
            title:SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.pinkAccent),
                controller: itemDescriptionTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Ürün Açıklaması",
                    hintStyle:  TextStyle(color: Colors.pinkAccent)
                ),
              ),
            ) ,
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 1,
          ),


          //ürün fiyatı
          ListTile (
            leading: const Icon(
              Icons.price_change,
              color: Colors.white,
            ),
            title:SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.pinkAccent),
                controller: itemPriceTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Ürün Fiyatı",
                    hintStyle:  TextStyle(color: Colors.pinkAccent)
                ),
              ),
            ) ,
          ),
          const Divider(
            color: Colors.pinkAccent,
            thickness: 1,
          ),



        ],
      ),
    );

  }

  //default screen
  Widget defaultScreen()
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          "Yeni Ürün Ekle",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate,
              color: Colors.white,
              size: 200,
            ),
            ElevatedButton(
              onPressed: ()
                  {
                    showDialogBox();
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
              ),
              child: const Text(
                "Yeni Ürün Ekle",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }


  showDialogBox()
  {
    return showDialog(
      context: context,
      builder: (c)
        {
          return SimpleDialog(
            backgroundColor:  Colors.black,
              title: const Text(
                "Ürün Fotoğrafı",
                style:  TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            children: [
              SimpleDialogOption(
                onPressed: ()
                    {
                        captureImageWithPhoneCamera();
                    },
                child:  const Text(
                  "Kamere ile yükle",
                  style:  TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              SimpleDialogOption(
                onPressed: ()
                {
                   chooseImageFromPhoneGallery();
                },
                child:  const Text(
                  "Galeriden Seç",
                  style:  TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              SimpleDialogOption(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                child:  const Text(
                  "İptal Et",
                  style:  TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),


            ],
          );
        }
    );
  }


  captureImageWithPhoneCamera() async
  {
    Navigator.pop(context);
    try
        {
          final pickedImage= await ImagePicker().pickImage(source: ImageSource.camera);

          if (pickedImage!=null)
            {
              String imagePath=pickedImage.path;
              imageFileUint8List = await pickedImage.readAsBytes();

              //resimden arka planı kaldır
              //resmi şeffaf yap
             imageFileUint8List = await ApiConsumer().removeImageBackgroundApi(imagePath);


              setState(() {
                imageFileUint8List;
              });
            }
        }
        catch(errorMsg)
        {
          print(errorMsg.toString());

          setState(() {
            imageFileUint8List= null;
          });
        }

  }

  chooseImageFromPhoneGallery() async
  {
    Navigator.pop(context);

    try
    {
      final pickedImage= await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage!=null)
      {
        String imagePath=pickedImage.path;
        imageFileUint8List = await pickedImage.readAsBytes();

        //resimden arka planı kaldır
        //resmi şeffaf yap
        imageFileUint8List = await ApiConsumer().removeImageBackgroundApi(imagePath);

        setState(() {
          imageFileUint8List;
        });
      }
    }
    catch(errorMsg)
    {
      print(errorMsg.toString());

      setState(() {
        imageFileUint8List= null;
      });
    }

  }



  @override
  Widget build(BuildContext context)
  {
    return imageFileUint8List== null ? defaultScreen(): uploadFormScreen();
  }

}
