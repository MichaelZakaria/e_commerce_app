import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;


  @override
  Widget build(BuildContext context) {
    // Initialize the controller or manging product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      /// AppBar
      appBar: MyAppBar(title: Text(title), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(MySizes.defaultSpaces),
            child: FutureBuilder(
                future: futureMethod  ?? controller.fetchProductsByQuery(query),
                builder: (context, snapshot) {
                  // Check the state of the FutureBuilder snapshot
                  final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                  // If products are not found
                  if (widget != null) return widget;

                  // Products found!
                  final products = snapshot.data!;

                  return MySortableProducts(products: products,);
                },
            ),
        ),
      ),
    );
  }
}
