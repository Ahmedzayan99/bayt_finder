import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../extensions/common.dart';
import '../../../local_storage/shared_preferences_manager.dart';
import '../../../models/auth/otp_login_response.dart';
import '../../../network/dio_maneger.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  DioManager dioManager = DioManager();
  String? errorMessage;
///login
  // PhoneNumber phoneNumber = PhoneNumber(isoCode: "IQ");
  PhoneNumber phoneNumber = PhoneNumber(isoCode: "EG");
  FocusNode mobileFocus = FocusNode();
  TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool isUserExist = true;

  SocialLoginResponse loginModel = SocialLoginResponse();
  Future<void> login() async {
    await SharedPreferencesManager.removeData('token');
    emit(LoginLoadingState());
    Either<String, SocialLoginResponse> response = await dioManager.login(
      phone: phoneNumber.phoneNumber.toString(),
    );
    response.fold(
          (left) {
        errorMessage = left;
        toast(left.toString());
        emit(LoginErrorState());
      }, (right) async {

      loginModel = right;
      isUserExist = loginModel.isUserExist!;
      emit(LoginSuccessState());
/*
      await PrefsManager.saveData(key: 'token',value:loginModel.data!.apiToken);
*/

    },
    );
  }
  void clearData() {
    phoneNumber = PhoneNumber(isoCode: "EG");
    mobileNumberController = TextEditingController();
    errorMessage = null;
    emit(ClearDataState());
  }

/*  Future<void> sendOTP(context) async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      hideKeyboard(context);
      await appStore.setLoading(true);
      String number = '$countryCode${mMobileNumberCont.text.trim()}';
      if (!number.startsWith('+')) {
        number = '$mMobileNumberCont${mMobileNumberCont.text.trim()}';
      }
      await loginWithOTP(
          context, number, mMobileNumberCont.text.trim(), true, () {})
          .then((value) {})
          .catchError((e) async {
        toast(e.toString());
        await appStore.setLoading(false);
        setState(() {});
      });
    }
  }*/

  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  Timer? timer;
  bool isResendEnabled = false;
  int resendTimeout = 120;

  void startResendTimer() {
    resendTimeout = 120;
    isResendEnabled = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTimeout > 0) {
        resendTimeout--;
        emit(ResendTimeout());
      } else {
        isResendEnabled = false;
        timer.cancel();
        emit(ResendTimeout());
      }
    });
  }

  String formatTime() {
    final minutes = (resendTimeout ~/ 60).toString().padLeft(2, '0');
    final seconds = (resendTimeout % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void stopTimer() {
    timer!.cancel();
    emit(ResendTimeout());
  }

 /* Future<void> resendOTP() async {
    resendTimeout = 120;
    isResendEnabled = false;
    toast("e.toString()");
    await loginWithOTPFirbase(
        ).then((value) {
    }).catchError((e) {
      toast(e.toString());
    });
  }

  Future<void> submit() async {
    *//* hideKeyboard(context);
    await appStore.setLoading(true);
    AuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId!, smsCode: otpCode);
    Map req = {
      "username": widget.phoneNumber!.replaceAll('+', ''),
      "login_type": LoginTypeOTP,
      "user_type": LoginUser,
      "accessToken": widget.phoneNumber!.replaceAll('+', ''),
      "contact_number": widget.phoneNumber,
      'player_id': SharedPreferencesManager.getStringAsync(PLAYER_ID).validate(),
    };
    await otpLogInApi(req).then((value) async {
      await SharedPreferencesManager.saveData(IS_OTP, true);
      appStore.setPhoneNo(widget.phoneNumber!.replaceAll('+', ''));
      appStore.setLoading(false);
      if (value.isUserExist == false) {
        finish(context);
        SignUpScreen(phoneNumber: widget.phoneNumber!.replaceAll('+', '')).launch(context);
      } else {
        await appStore.setLogin(true);
        SharedPreferencesManager.saveData(TOKEN, value.data!.apiToken.validate());
        appStore.setToken(value.data!.apiToken.validate());
        await getUSerDetail(context, value.data!.id.validate()).whenComplete(() {
          DashboardScreen().launch(context, isNewTask: true);
        });
      }
    }).catchError((e) async {
      print("Into otp Screen Error?");
      await appStore.setLoading(false);
      if (e.toString().contains('invalid_username')) {
        finish(context);
        SignUpScreen(phoneNumber: widget.phoneNumber!.replaceAll('+', '')).launch(context);
      } else {
        if (e.toString().contains('OTP is invalid')) toast(language.invalidOtp);
      }
    *//*
  }
*//*    await FirebaseAuth.instance.signInWithCredential(credential).then((result) async {

    }).catchError((e) async {
      log("error->" + e.toString());
      toast(e.toString());
      await appStore.setLoading(false);
      setState(() {});
    });*//*
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> loginWithOTPFirbase() async {
    return await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.phoneNumber.toString(),
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) async {
        await appStore.setLoading(false);
        if (e.code == 'invalid-phone-number') {
          // appStore.setLoading(false);
          toast(language.theProvidedPhoneNumberIsNotValid);
          throw 'The provided phone number is not valid.';
        } else {
          toast(e.toString());
          throw e.toString();
        }
      },
      timeout: Duration(minutes: 1),
      codeSent: (String verificationId, int? resendToken) async {
     *//*   if (resend == true) {
          OTPScreen(
            *//**//*  verificationId: verificationId,
          isCodeSent: true,
          phoneNumber: phoneNumber,
          mobileNo: mobileNo,
          onCall: () {},*//**//*
          ).launch(context);
        }*//*
        return;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //
      },
    );
  }*/
}
