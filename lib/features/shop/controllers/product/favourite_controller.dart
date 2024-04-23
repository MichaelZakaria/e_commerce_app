import 'dart:convert';

import 'package:e_commerce_app/data/repositories/product/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/local_storage/storage_utility.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();


  /// Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from storage
  void initFavourites() {
    final json = MyLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    MyLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      MyLoaders.customToast(message: 'Product has been added to the wishlist');
    } else {
      // I think it's not useful ####################################################################3
      MyLocalStorage.instance().removeData(productId);

      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      MyLoaders.customToast(message: 'Product has been removed from the wishlist');
    }
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }

}