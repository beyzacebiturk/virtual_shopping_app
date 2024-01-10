import 'package:flutter/material.dart';
import 'package:virtual_shopping_app/items.dart';
import 'package:virtual_shopping_app/virtual_ar_view_screen.dart';

class ItemDetailsScreen extends StatefulWidget {
  Items? clickedItemInfo;

  ItemDetailsScreen({
    this.clickedItemInfo,
  });

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}


class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 212, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 145, 179),
        title: Text(
          widget.clickedItemInfo!.itemName.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Color.fromARGB(255, 247, 145, 179),
      onPressed: ()
     {
//sanallığı deneme
      Navigator.push(context, MaterialPageRoute(builder: (c)=> VirtualARViewScreen(
        clickedItemImageLink: widget.clickedItemInfo!.itemImage.toString(),
      )));
     },
     label: const Text(
      "Sanal Deneme", 
     ),
     icon: const Icon(
      Icons.mobile_screen_share_rounded,
      color: Color.fromARGB(255, 255, 255, 255),
     ),
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.clickedItemInfo!.itemImage.toString(),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  widget.clickedItemInfo!.itemName.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 234, 87, 136),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 6.0),
                child: Text(
                  widget.clickedItemInfo!.itemDescription.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color.fromARGB(255, 75, 73, 73),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.clickedItemInfo!.itemPrice.toString() + "\₺",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 234, 87, 136),
                  ),
                ),
              ),

                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 310.0),
                  child: Divider(
                    height: 1,
                    thickness: 2,
                    color: Colors.pink,
                  ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
