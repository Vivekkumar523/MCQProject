

import 'package:purchases_flutter/purchases_flutter.dart';


class PurchaseModel{
  final List<Package> offerings;
  final String mainTitle;
  final String subTitle;
  final String featureDescription;
  final String featureKey;
  bool isEntireApp;


  PurchaseModel({
    required this.offerings,
    required this.mainTitle,
    required this.subTitle,
    required this.featureDescription,
    required this.featureKey,
    this.isEntireApp = false
  });

}