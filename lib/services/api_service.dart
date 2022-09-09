// import 'dart:convert';
//
// import 'package:ecommerce_bloc_demo/utils/app_constants.dart';
//
// import '../model/login_master.dart';
// import '../utils/utility.dart';
// import 'api_params.dart';
// import 'base_services.dart';
// import 'package:http/http.dart' as http;
//
// class ApiServices extends BaseServices {
//   @override
//   Future<LoginMaster?> login(
//       {required String email, required String password, onNoInternet}) async {
//     if (await Utility.isConnected()) {
//       try {
//         String getParams() {
//           var map = new Map<String, dynamic>();
//           map[ApiParams.email] = email;
//           map[ApiParams.password] = password;
//           printf("Login Parameter: " + json.encode(map));
//           return json.encode(map);
//         }
//         Uri uri = Uri.parse(AppConstants.login);
//         final http.Response response = await http.post(
//           uri,
//           body: getParams(),
//           headers: {
//             "Accept": "application/json",
//             "Content-Type": "application/json"
//           },
//         );
//         printf("Headers :" + response.headers.toString());
//         printf("URL :" + response.request!.url.toString());
//         printf("Response :" + response.body);
//         return LoginMaster.fromJson(json.decode(response.body));
//       } catch (err) {
//         printf("Error: " + err.toString());
//         return null;
//       }
//     } else {
//       if (onNoInternet != null) onNoInternet();
//       return null;
//     }
//   }
// }
