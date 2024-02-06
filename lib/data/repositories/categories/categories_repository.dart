import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/services/firebase_storage_service.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/plattform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;
  /// Gat all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }
  /// Get sub categories

  /// Upload categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the categories along with their images
      final storage = Get.put(MyFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image and get it's url
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign Url to category.image attribute
        category.image = url;

        // Store category in firebase
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }

    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }
}