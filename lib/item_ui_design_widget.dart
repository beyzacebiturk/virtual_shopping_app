import 'package:flutter/material.dart';
import 'package:virtual_shopping_app/items.dart';

class ItemUIDesignWiget extends StatefulWidget {

  Items? itemsInfo;
  BuildContext? context;

  ItemUIDesignWiget({
    this.itemsInfo, 
    this.context});

  @override
  State<ItemUIDesignWiget> createState() => _ItemUIDesignWigetState();
}

class _ItemUIDesignWigetState extends State<ItemUIDesignWiget> {
  @override
  Widget build(BuildContext context) 
  {
    return InkWell(
      onTap: ()
      {
//send user to the item detail screen
      },
      splashColor: Colors.pink,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: 190,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [

              Image.network(
                widget.itemsInfo!.itemImage.toString(),
                width: 140,
                height: 140,
              ),
              
              const SizedBox(width: 4.0,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),

                      //item name 
                    Expanded(
                      child: Text(
                        widget.itemsInfo!.itemName.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          )
                        ),
                      ),

                      const SizedBox(
                        height: 5.0,
                      ),
                      //seller name
                       Expanded(
                      child: Text(
                        widget.itemsInfo!.sellerName.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 14,
                          )
                        ),
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      //show discount badge - %50 OFF badge
                      //price original
                      // new price
                      Row(
                        children: [
                          //%50 OFF badge
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.pink,
                            ),
                            alignment: Alignment.topLeft,
                            width: 40,
                            height: 44,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    "50%", 
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),


                                  Text(
                                    "OFF", 
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        
                        const SizedBox(
                          width: 10,
                        ),

                        //original price
                        //new price 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            //original price
                            Row(
                              children: [
                                 const Text(
                              "Orijinal Fiyat: \₺",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              (double.parse(widget.itemsInfo!.itemPrice!) + (double.parse(widget.itemsInfo!.itemPrice!))).toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                              ],
                            ),


                           //new price 
                            Row(
                              children: [
                                 const Text(
                              "Yeni Fiyat: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                             const Text(
                              "\₺",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              widget.itemsInfo!.itemPrice.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                              ],
                            ),

                          ],
                        )
                        ],
                      ),
                  
                  const Divider(
                    height: 4,
                    color: Colors.white70,
                  ),

                  ],
                  )
                  )
            ],
          )),
        ),
        
    );
  }
}
