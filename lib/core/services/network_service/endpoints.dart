// import 'package:flutter/material.dart';
// import 'package:ttt/core/services/cache/cash_helper.dart';
// import 'package:ttt/core/services/network_service/api_service.dart';
// import 'package:ttt/core/utils/kString.dart';
// import 'package:dio/dio.dart' as d;

// //1067880457
// class EndPoints {
//   static const baseUrl = "https://aman.codeella.com/api";
//   static const homeUser = "/client/home";

//   static const companyOrders = "/company/orders";
//   static const companyProfile = "/client/company/profile/";
//   static const review = "/client/company/reviews/";

//   static const countries = "/data/countries";
//   static const governates = "/data/governorate";
//   static const cities = "/data/cities";
//   static const login = '/auth/login';
//   static const register = '/auth/register';
//   static const verifyAccount = '/auth/verify-account';
//   static const resendCode = '/auth/verify-account/re-send-code';
//   static const checkCredential = '/forget-password/check-credential';
//   static const forgetPasswordCheckOtp = '/forget-password/check-otp';
//   static const forgetPasswordReset = '/forget-password/reset-password';
//   static const departments = '/data/departments';
//   static const changePassword = '/profile/update/password';
//   static const editProfile = '/profile/update/information';
//   static const policy = '/data/about/policy';
//   static const aboutUs = '/data/about/about_us';
//   static const deleteProfile = '/profile/delete';
//   static const completeRegister = '/complete-register';
//   static const getPreviousAddresses = "/client/addresses";

//   static const order = '$baseUrl/client/orders';
//   static const companyOrder = '$baseUrl/company/orders';
//   static const notifications = '$baseUrl/notifications';
//   static const getChatList = '$baseUrl/chat/list';
//   static const chatByUserId = '$baseUrl/chat/';
//   static const sendMessage = '$baseUrl/chat/send';
//   static const settings = '$baseUrl/data/settings';
//   static createChatChannel({required int userId, required int chatId}) {
//     return "chat-$chatId-user-$userId";
//   }

//   static String getNotificationsChannel({
//     required String userId,
//   }) =>
//       "channel-notify-$userId";

//   static getSettings() async {
//     DioImpl dio = DioImpl();

//     d.Response res = await dio.get(endPoint: settings);
//     debugPrint('settings saved');
//     CashHelper.setData(
//       kStrings.realtime_pusher_app_id,
//       res.data['data'][kStrings.realtime_pusher_app_id],
//     );
//     CashHelper.setData(
//       kStrings.realtime_pusher_app_key,
//       res.data['data'][kStrings.realtime_pusher_app_key],
//     );
//     CashHelper.setData(
//       kStrings.realtime_pusher_app_secret,
//       res.data['data'][kStrings.realtime_pusher_app_secret],
//     );
//     CashHelper.setData(
//       kStrings.realtime_pusher_app_cluster,
//       res.data['data'][kStrings.realtime_pusher_app_cluster],
//     );

//     print(res.data['data']);
//   }
// }




// /*
// {
//   "Id": integer,
//   "CustomerId": integer,
//   "JobModelList": [
//     {
//       "JobId": integer,
//       "DateFrom": "string",
//       "DateTo": "string",
//       "CompanyNameAr": "string",
//       "CompanyNameEn": "string",
//       "IsHere": boolean,
//       "DescriptionAr": "string",
//       "DescriptionEn": "string"
//     },
//     // ... (more jobs)
//   ]
// }
// */
// /*
// {
//   "CustomerId": integer,
//   "ContactModelList": [
//     {
//       "ContactTypeId": integer,
//       "ContactNumber": "string"
//     },
//     // ... (more contacts)
//   ]
// }
// */
