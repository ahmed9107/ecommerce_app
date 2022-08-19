import 'package:store_app/models/onboarding_model.dart';

import '../../../utils/constants/image_asset.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: 'Discover',
    image: ImageAsset.onboardingImgFirst,
    body: 'Explore world\'s top brands \n and boutiques'),
  OnboardingModel(
    title: 'Make the payment',
    image: ImageAsset.onboardingImgSecond,
    body: 'Choose the preferable\n option of payment'),
  OnboardingModel(
    title: 'Enjoy you shopping',
    image: ImageAsset.onboardingImgThird,
    body: 'Get high quality products\n for the best prices'),
];
