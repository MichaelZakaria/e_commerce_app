import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: Text('Popular Products'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpaces),
          child: MySortableProducts(),
        ),
      ),
    );
  }
}


