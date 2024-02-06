import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if(_connectionStatus.value == ConnectivityResult.none) {
      MyLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check the internet connection status
  /// Returns 'true' in connected, 'false' otherwise

  Future<bool> isConnected() async {
     try {
       final result = await _connectivity.checkConnectivity();
       if (result == ConnectivityResult.none) {
         return false;
       } else {
         return true;
       }
     } on PlatformException catch (_) {
       return false;
     }
  }

  /// Dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

}