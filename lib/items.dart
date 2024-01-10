import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  String? itemID;
  String? itemName;
  String? itemDescription;
  String? itemImage;
  String? sellerName;
  String? sellerPhone;
  String? itemPrice;
  Timestamp? publishedDate;
  String? status;

  Items({
    this.itemID,
    this.itemName,
    this.itemDescription,
    this.itemImage,
    this.sellerName,
    this.sellerPhone,
    this.itemPrice,
    this.publishedDate,
    this.status,
  });

  Items.fromJson(Map<String, dynamic> json) {
    itemID = json["Ürün ID"];
    itemName = json["Ürün Adı"];
    itemDescription = json["Ürün Tanımı"];
    itemImage = json["Ürün Görseli"];
    sellerName = json["Satıcı Adı"];
    sellerPhone = json["Satıcı tel"];
    itemPrice = json["Ürün Fiyatı"];
    publishedDate = json["Yayınlanma Tarihi"];
    status = json["Durum"];
  }
}
