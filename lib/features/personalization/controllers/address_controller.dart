import 'package:e_commerce_app/data/repositories/address/address_repository.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final addressRepository = Get.put(AddressRepository());
}