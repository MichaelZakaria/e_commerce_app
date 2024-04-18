import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({required this.id, required this.name, required this.image, this.isFeatured, this.productsCount});

  /// Helper Function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  /// Convert model to Json structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured
    };
  }

  /// Map Json oriented document from firebase to BrandModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (document.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: data['ProductsCount'] ?? '',
    );
  }

  /// Map Json oriented document (snapshot) from firebase to BrandModel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: data['ProductsCount'] ?? '',
      );
    } else {
     return BrandModel.empty();
    }
  }
}