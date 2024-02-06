import 'package:e_commerce_app/data/repositories/banners/banners_repository.dart';
import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loader.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final carousalCurrentIndex = 0.obs;

  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show the loader while loading categories
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }
}