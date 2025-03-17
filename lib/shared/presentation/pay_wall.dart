// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../domain/model/purchase_model.dart';
// import '../provider/shared_pref_provider.dart';

// class PayWall extends StatefulWidget {
//   const PayWall({super.key, required this.purchaseModel});
//   final PurchaseModel purchaseModel;
//   @override
//   State<PayWall> createState() => _PayWallState();
// }

// class _PayWallState extends State<PayWall> {
//   int selectedCard = 0;
//   List<Package> _offerings = [];
//   bool isEntirePayWall = false;
//
//   @override
//   void initState() {
//     super.initState();
//     isEntirePayWall = widget.purchaseModel.isEntireApp;
//     _offerings = widget.purchaseModel.offerings;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         foregroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 28.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(6),
//                   child: Image.asset(
//                     "assets/icons/app_icon.png",
//                     width: 110,
//                     height: 110,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24),
//               Text(
//                 widget.purchaseModel.mainTitle,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w900,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 widget.purchaseModel.subTitle,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.green,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               Platform.isIOS ? Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       _launchTermsURL();
//                     },
//                     child: Text(
//                       'Terms of Service',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.green,
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.green,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '|',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.green,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       _launchPrivacyPolicy();
//                     },
//                     child: Text(
//                       'Privacy Policy',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.green,
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.green,
//                       ),
//                     ),
//                   ),
//                 ],
//               ) : SizedBox(height: 30),
//               SizedBox(height: 5),
//               ..._offerings.asMap().entries.map((entry) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedCard = entry.key + 1;
//                     });
//                   },
//                   child: _iosCard(entry.value, entry.key),
//                 );
//               }),
//               SizedBox(height: 30),
//               Text(
//                 'Recurring Payment, Cancel anytime',
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 10),
//               BuildButton(
//                 onPressed: () async {
//                   try {
//                     final packageToPurchase = _offerings[selectedCard];
//                     CustomerInfo purchaserInfo =
//                         await Purchases.purchasePackage(packageToPurchase);
//                     if (purchaserInfo.entitlements.active.isNotEmpty) {
//                       if (!context.mounted) return;
//                       Provider.of<SharedPrefProvider>(context, listen: false)
//                           .setBoolValue(widget.purchaseModel.featureKey, true);
//                       Navigator.pop(context);
//                     }
//                   } on PlatformException catch (e) {
//                     if (!context.mounted) return;
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBarUtil.showErrorSnackBar(e.message!));
//                   }
//                 },
//                 buttonWidget: Text(
//                   'Subscribe',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: () async {
//                   await PurchaseApi().restorePurchase();
//                 },
//                 child: Text(
//                   'Restore Purchase',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _launchTermsURL() async {
//     final url = Uri.parse('https://www.apple.com/legal/internet-services/itunes/dev/stdeula/');
//     try{
//       await launchUrl(url);
//     } catch (e) {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchPrivacyPolicy() async {
//     final url = Uri.parse('https://aityl.com/privacy-Policy-2');
//     try{
//       await launchUrl(url);
//     } catch (e) {
//       throw 'Could not launch $url';
//     }
//   }
//
//
//   String _extractTitle(String fullTitle) {
//     RegExp regExp = RegExp(r'(.+?)\s\(');
//     Match? match = regExp.firstMatch(fullTitle);
//     return match?.group(1) ?? fullTitle;
//   }
//
//
//
//   Widget _iosCard(Package package, int index) {
//     int cardIndex = _offerings.indexOf(package);
//     bool isSelected = cardIndex == selectedCard;
//     const String androidDescriptionText = "Generate 40 rows/lines of data per prediction";
//     String productTitle = _extractTitle(package.storeProduct.title);
//     String productDescription = Platform.isIOS ? package.storeProduct.description : androidDescriptionText;
//     final priceString = package.storeProduct.priceString;
//     String price = "$priceString/${index == 0 ? "6 Months" : "Year"}";
//
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedCard = cardIndex;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         margin: EdgeInsets.only(bottom: 14),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue : Colors.green,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: Colors.green,
//             width: 1.5,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       productTitle,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: isSelected ? Colors.blue : Colors.green,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 2),
//                     Text(
//                       price,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w600,
//                         color: isSelected ? Colors.blue : Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 2),
//                   height: 20,
//                   width: 20,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: isSelected ? Colors.blue : Colors.green,
//                       width: 1.5,
//                     ),
//                   ),
//                   child: isSelected
//                       ? Icon(
//                     Icons.check,
//                     color: Colors.blue,
//                     size: 14,
//                   )
//                       : null,
//                 ),
//               ],
//             ),
//             SizedBox(height: 2),
//             Divider(
//               color: isSelected ? Colors.blue : Colors.green,
//               thickness: 1.5,
//             ),
//             SizedBox(height: 2),
//             Text(
//               productDescription,
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500,
//                 color: isSelected ? Colors.blue : Colors.green,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
