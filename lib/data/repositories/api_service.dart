import 'dart:convert';
import 'package:bhau_777/data/models/add_fun_model.dart';
import 'package:bhau_777/data/models/jackpot_screen_model.dart';
import 'package:bhau_777/data/models/registration_model.dart';
import 'package:bhau_777/data/models/show_detail_addfund_model.dart';
import 'package:bhau_777/data/models/starline_model.dart';
import 'package:bhau_777/data/models/withdraw_fund_model.dart';
import 'package:http/http.dart' as http;
import 'package:bhau_777/data/models/get_otp_model.dart';
import '../models/cart_list_model.dart';
import '../models/check_user_model.dart';
import '../models/forgot_mpin_model.dart';
import '../models/forgot_verify_otp_model.dart';
import '../models/game_list_model.dart';
import '../models/loginwithmpin_screen.dart';
import '../models/singup_model.dart';
import '../models/verified_otp_model.dart';

class ApiService{
  //http://16.170.215.79:4000/api/v1/
  final String baseUrl = "http://16.170.215.79:4000/api/v1";
  Future<int?> checkUser({required String deviceId}) async{
    try{
      var url = Uri.parse('$baseUrl/user/checkUser');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          'deviceId': deviceId,
        },),

      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
var m =  CheckUserModel.fromJson(jsonDecode(response.body)).status;
        return m;
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
  }
  Future<GetLoginModel?> getOtp(int number , String deviceId) async{
    try{
      var url = Uri.parse('$baseUrl/user/getOtp');
      var response = await http.post(url,
        headers: {
        "Content-Type": "application/json",
      },
          body: jsonEncode(<String, dynamic>{
            'mobile': number,
            'deviceId': deviceId,
          },),

          );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return GetLoginModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  Future<RegistrationModel?> registrationApi({required String mpin , required String deviceId}) async{
    try{
      var url = Uri.parse('$baseUrl/user/setMpin');
      var response = await http.post(url,
        headers: {
        "Content-Type": "application/json",
      },
          body: jsonEncode(<String, dynamic>{
            'mpin': mpin,
            'deviceId': deviceId,
          },),

          );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return RegistrationModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
  }
  Future<SignUpModel?> singUpApi({required String name , required String deviceId, required String language, required String city, required String state}) async{
    try{
      var url = Uri.parse('$baseUrl/user/signup');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "deviceId": deviceId,
          "name": name,
          "language": language,
          "city": city,
          "state": state
        },),

      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);

        return SignUpModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  Future<VerifiedOtpModel?> verifiedOtpApi({required int otp , required String deviceId}) async{
    try{
      var url = Uri.parse('$baseUrl/user/varifiedOtp');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "deviceId": deviceId,
          "otp": otp
        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return VerifiedOtpModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  Future<forgotMpinModel?> forgotMPin({required int mobile , required String deviceId}) async{
    try{
      var url = Uri.parse('$baseUrl/user/forgotMpinSendOtp');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "deviceId": deviceId,
          "mobile": mobile
        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return forgotMpinModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  Future<FPasswordVerifyOtpModel?> FVerifyforgotOtp({required int otp , required String deviceId}) async{
    try{
      var url = Uri.parse('$baseUrl/user/forgotPasswordVerifyOtp');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "deviceId": deviceId,
          "otp": otp
        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return FPasswordVerifyOtpModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<LoginWithMpinModel?> loginWithMpin({
    required String mpin , required String deviceId, required String firebaseToken, }) async{
    try{
      var url = Uri.parse('$baseUrl/common/generate-token');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "deviceId": deviceId,
          "mpin": mpin,
          "firebaseToken": firebaseToken
        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return LoginWithMpinModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  Future<HomeGameModel?> getListForGame({required String userId,required String token}) async{
    try{
      var url = Uri.parse('$baseUrl/user/games/allGames');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return HomeGameModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
  Future<JackpotScreenModel?> getJackpotList({required String userId,required String token}) async{
    try{
      var url = Uri.parse('$baseUrl/user/games/jackPotAllGames');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
        },),
      );

      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return JackpotScreenModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<StarLineScreenModel?> getSartlineList({required String userId,required String token}) async{
    try{
      var url = Uri.parse('$baseUrl/user/games/starLineAllGames');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return StarLineScreenModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<CardListModel?> CardList({required String userId,required String gameType, required String token}) async{
    try{
      var url = Uri.parse('$baseUrl/user/games/cardList');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
          "gameType":gameType

        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return CardListModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<ShowDetailAddFundModel?> getDetailAddFund(
      {required String id, required String token}) async{
    try{
      var url = Uri.parse('$baseUrl/user/userPrfile?userId=$id');
      var response = await http.get(url,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },);
      print(response.body);
      if(response.statusCode == 200){
      //  print(response.body);
        return ShowDetailAddFundModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<AddFundModel?> addFundApi({
    required String userId,
    required String token,
    required int amount}) async{
    try{
      var url = Uri.parse('$baseUrl/user/fund/addFund');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          "userId": userId,
          "amount":amount

        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return AddFundModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<WithdrawFundModel?> withdrawfundApi({
    required String userId,
    required String token,
    required int amount}) async{
    try{
      var url = Uri.parse('$baseUrl/user/fund/withdrawFund');
      var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          "userId":userId,
          "reqAmount": amount

        },),
      );
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        return WithdrawFundModel.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('faild to login');
      }
    }catch(e){
      print(e);
    }
    return null;
  }
}
// class ApiService {
//   Future<GetOtpModel?> getOtp(String number, String deviceId) async {
//     try {
//       var url = Uri.parse('http://192.168.1.9:4000/api/v1/user/getOtp');
//       var response = await http.post(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode(<String, dynamic>{
//           'mobile': number,
//           'deviceId': deviceId,
//         }),
//       );
//
//       print(response.body);
//
//       if (response.statusCode == 200) {
//         // Deserialize the JSON response into a Map
//         var jsonResponse = jsonDecode(response.body);
//
//         // Map the response to the GetOtpModel
//         var otpModel = GetOtpModel.fromJson(jsonResponse);
//
//         if (otpModel.success) {
//           // OTP request successful
//           return otpModel;
//         }
//         else {
//           throw Exception('OTP Request Failed: ${otpModel.message}');
//         }
//       } else {
//         throw Exception('Failed to get OTP');
//       }
//     } catch (e) {
//       print('Error: $e');
//       return null; // Return null in case of failure
//     }
//   }
// }
