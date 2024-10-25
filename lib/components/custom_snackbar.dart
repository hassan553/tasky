// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ttt/core/utils/app_colors.dart';

// GetSnackBar buildCustomSnackbar(String msg, bool isSuccessfullState) {
//   double width = getSnackWidth(msg);
//   return GetSnackBar(
//       snackPosition: SnackPosition.TOP,
//       borderRadius: 30,
//       padding: const EdgeInsets.all(5),
//       maxWidth: width,
//       duration: const Duration(seconds: 2),
//       backgroundColor:
//           isSuccessfullState ? AppColors.greenColor : AppColors.redColor,
//       messageText: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(isSuccessfullState ? Icons.done_rounded : Icons.warning,
//               color: AppColors.whiteColor),
//           const SizedBox(
//             width: 10,
//           ),
//           SizedBox(
//             width: width - 60,
//             child: Text(
//               msg,
//               style: const TextStyle(color: AppColors.whiteColor),
//             ),
//           ),
//         ],
//       ))
//     ..show();
// }

// GetSnackBar buildErrorSnackbar(String err) {
//   double width = getSnackWidth(err);
//   return GetSnackBar(
//       snackPosition: SnackPosition.TOP,
//       borderRadius: 30,
//       padding: const EdgeInsets.all(5),
//       maxWidth: width,
//       duration: const Duration(seconds: 2),
//       backgroundColor: AppColors.redColor,
//       messageText: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.warning, color: AppColors.whiteColor),
//           const SizedBox(
//             width: 10,
//           ),
//           Text(
//             err,
//             style: const TextStyle(color: AppColors.whiteColor),
//           ),
//         ],
//       ));
// }

// double getSnackWidth(String msg) {
//   int msgLength = msg.split(" ").length;
//   if (msgLength == 1) return Get.width * 0.3;
//   return msgLength > 3 ? Get.width * 0.9 : Get.width * 0.42;
// }
