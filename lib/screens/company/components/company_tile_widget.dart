// import 'package:flutter/material.dart';

// import '../../../models/company_model.dart';
// import '../../../utils/api_endpoints.dart';
// import '../../../utils/themes.dart';
// import '../company_page.dart';

// class CompanyTileWidget extends StatelessWidget {
//   final String? logoFile;
//   final String? name;
//   final String? building;
//   final String? street;
//   final String? countryName;
//   final String? postalCode;
//   const CompanyTileWidget({
//     Key? key,
//     required this.logoFile,
//     @required this.name,
//     @required this.building,
//     @required this.street,
//     @required this.countryName,
//     @required this.postalCode,
//   }) : super(key: key);

//   @override
//   Widget build(context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           width: 10.0,
//         ),
//         SizedBox(
//           height: 80.0,
//           width: 100.0,
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: Image.network(ApiUrl.companyLogoFileLink + logoFile!),
//           ),
//         ),
//         const SizedBox(
//           width: 5.0,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: ScreenSize.width * 0.5,
//               child: Text(
//                 name!,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Text(
//               building!,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               street!,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               name! + " " + postalCode!,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             const Text(
//               "+65 68832883",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         // const Expanded(
//         //   child: SizedBox(),
//         // ),
//         // const Icon(
//         //   Icons.star,
//         //   color: Colors.white,
//         //   size: 20.0,
//         // ),
//         // const SizedBox(
//         //   width: 10.0,
//         // ),
//       ],
//     );
//   }
// }
