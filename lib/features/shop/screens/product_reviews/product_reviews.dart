import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/ratings_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: const MyAppBar(title: Text('Reviews and Ratings'), showBackArrow: true,),

      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(height: MySizes.spaceBtwItems,),

              /// overall product ratings
              const MyOverallProductRating(),
              const MyRatingBarIndicator(rating: 4.5,),
              Text('19,945', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: MySizes.spaceBtwSections,),

              /// user review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}




