import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shopping_app/item_ui_design_widget.dart';
import 'package:virtual_shopping_app/items.dart';
import 'package:virtual_shopping_app/items_upload_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text("Virtual Shop", //burayı değiştirip marka adı koyulacak

                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => ItemsUploadScreen()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.pink,
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("items")
              .orderBy("Yayınlanma Tarihi", descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot dataSnapshot) 
          {
            if (dataSnapshot.hasData) 
            {
              return ListView.builder(
                itemCount: dataSnapshot.data!.docs.length,
                itemBuilder: (context, index)
                 {
                 Items eachItemInfo = Items.fromJson(
                    dataSnapshot.data!.docs[index].data() as Map<String, dynamic>
                    );

                    return ItemUIDesignWiget(
                      itemsInfo: eachItemInfo,
                      context: context,
                    );
                },
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Veri uygun değil.",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
