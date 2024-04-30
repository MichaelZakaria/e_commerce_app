import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/data/repositories/address/address_repository.dart';
import 'package:e_commerce_app/features/personalization/models/address_model.dart';
import 'package:e_commerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/utils/network/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/sizes.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Select a specific address
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Start loader
      Get.dialog(
          const Center(child: CircularProgressIndicator())
      );

      // clear the "selected" field
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(newSelectedAddress.id, true);

      // Stop loading
      Get.back();
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Error in Selection', message: e.toString());
    }
  }

  /// Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    //addressFormKey.currentState?.reset();
  }

  /// Add new Address
  Future addNewAddress() async {
    try {
      // start loading
      MyFullScreenLoader.openLoadingDialog('Storing Address...', MyImages.personalInformationLoader);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      // save Address Data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true
      );
      final id = await addressRepository.addAddress(address);

      // Update Selected address status
      address.id = id;
      await selectAddress(address);

      // Remove loader
      MyFullScreenLoader.stopLoading();

      // Show Success message
      MyLoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully');

      // Refresh address screen
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();

    } catch (e) {
      // Remove Loader
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  /// Show Addresses ModalBottomSheet at checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(MySizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MySectionHeading(title: 'Select Address', showActionButton: false,),
                FutureBuilder(
                    future: getAllUserAddresses(),
                    builder: (_, snapshot) {
                      // Helper function to: handle error, no record or error message
                      final response = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                      if(response != null) return response;
          
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => MySingleAddress(
                              address: snapshot.data![index],
                              onTap: () async {
                                await selectAddress(snapshot.data![index]);
                                Get.back();
                              }
                          )
                      );
                    }
                ),
                const SizedBox(height: MySizes.defaultSpaces * 2,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddressScreen()), 
                    child: const Text('Add new address'),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  void onInit() {
    getAllUserAddresses();
    super.onInit();
  }
}