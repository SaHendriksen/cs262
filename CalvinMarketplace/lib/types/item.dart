/*
Defines class Item
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Item {
  Item({
    this.reference,
    @required this.sellerId,
    @required this.price,
    @required this.isOBO,
    @required this.name,
    this.description,
    this.imageURL,
    @required this.condition,
    @required this.category,
    this.iSBN,
    this.author,
    this.course,
    this.size,
    this.gender,
    this.brand,
  });

  final DocumentReference reference;
  final String sellerId;
  int price;
  bool isOBO;
  String name;
  String description;
  String imageURL;
  String condition;
  String category;

  String iSBN;
  String author;
  String course;

  String size;
  String gender;
  String brand;

  Item.fromMap(Map<String, dynamic> map, {this.reference}) :
    sellerId = map['sellerId'],
    price = map['price'],
    isOBO = map['isOBO'],
    name = map['name'],
    description = map['description'],
    imageURL = map['imageURL'],
    condition = map['condition'],
    category = map['category'],
    iSBN = map['iSBN'],
    author = map['author'],
    course = map['course'],
    size = map['size'],
    gender = map['gender'],
    brand = map['brand'];

  Item.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}