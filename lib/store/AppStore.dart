import 'dart:async';

import 'package:bayt_finder/extensions/extension_util/string_extensions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../extensions/common.dart';
import '../local_storage/shared_preferences_manager.dart';
import '../models/user_response.dart';
import '../screens/no_internet_screen.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../extensions/colors.dart';
import 'dart:convert';
import '../../extensions/system_utils.dart';

class AppStoreCubit extends Cubit<AppStoreState> {
  AppStoreCubit() : super(AppStoreInitial());

  static AppStoreCubit get(context) => BlocProvider.of(context);

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  void init() async {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status${e.message.validate()}');
      return;
    }
  /*  if (!mounted) {
      return Future.value(null);
    }*/

    return _updateConnectionStatus(result);
  }
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      log('not connected');
      //  isCurrentlyOnNoInternet = true;
      push(NoInternetScreen());
    } else {
      /*   if (isCurrentlyOnNoInternet) {
        pop();
        isCurrentlyOnNoInternet = false;
      }*/
      log('connected');
    }
    print("_connectionStatus--> $_connectionStatus");
  }
  bool isDarkModeOn = false;

  Future<void> setDarkMode(bool aIsDarkMode) async {
    isDarkModeOn = aIsDarkMode;
    if (isDarkModeOn) {
      textPrimaryColorGlobal = Colors.white;
      textSecondaryColorGlobal = viewLineColor;
      defaultLoaderBgColorGlobal = Colors.black26;
      defaultLoaderAccentColorGlobal = Colors.white;
      appButtonBackgroundColorGlobal = Colors.white;
      shadowColorGlobal = Colors.white12;
    } else {
      textPrimaryColorGlobal = textPrimaryColor;
      textSecondaryColorGlobal = textSecondaryColor;
      defaultLoaderAccentColorGlobal = primaryColor;
      defaultLoaderBgColorGlobal = Colors.white;
      appButtonBackgroundColorGlobal = primaryColor;
      shadowColorGlobal = Colors.black12;
    }
    await SharedPreferencesManager.saveData(isDarkModeOnPref, isDarkModeOn);
    emit(AppStoreAllState());
  }

  String userEmail = '';

  String selectedLanguage = "";

  bool isLoading = false;

  bool isLoggedIn = false;

  String uid = '';

  String userProfile = '';

  Future<void> setLogin(bool val, {bool isInitializing = false}) async {
    isLoggedIn = val;
    if (!isInitializing)
      await SharedPreferencesManager.saveData(IS_LOGGED_IN, val);
    emit(AppStoreAllState());
  }

  Future<void> setLoading(bool val) async {
    isLoading = val;
    emit(AppStoreAllState());
  }

  Future<void> setUId(String val, {bool isInitializing = false}) async {
    uid = val;
    if (!isInitializing) await SharedPreferencesManager.saveData(UID, val);
    emit(AppStoreAllState());
  }

  Future<void> setLanguage(String aCode, {BuildContext? context}) async {
    emit(AppStoreAllState());
  }

  int addPropertyIndex = 0;

  int userId = 0;

  String email = '';

  String password = '';

  String fName = '';

  String lName = '';

  String profileImage = '';

  String token = '';

  String username = '';

  String displayName = '';

  String phoneNo = '';

  String gender = '';

  String age = '';

  int isSubscribe = 0;

  SubscriptionDetail? subscriptionDetail;

  String termsCondition = '';

  String currencySymbol = '';

  String currencyCode = '';

  String currencyPosition = '';

  String oneSignalAppID = '';

  String onesignalRestApiKey = '';

  String admobBannerId = '';

  String admobInterstitialId = '';

  String admobBannerIdIos = '';

  String admobInterstitialIdIos = '';

  String chatGptApiKey = '';

  String privacyPolicy = "";

  String recentSearch = "";

  String latitude = "";

  String longitude = "";

  String minPrice = "";

  String maxPrice = "";

  String cityName = "";

  String subscription = "";

  int contactInfo = 0;

  int addLimitCount = 0;

  int advertisement = 0;

  int totalContactInfo = 0;

  int totalAddLimitCount = 0;

  int totalAdvertisement = 0;

  String userPlayerId = "";

  List<String> mRecentSearchList = [];

  UserResponse? userResponse;

  Future<void> setChatGptApiKey(String val,
      {bool isInitialization = false}) async {
    chatGptApiKey = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(ChatGptApiKey, val);
    emit(AppStoreAllState());
  }

  Future<void> setContactInfo(int val, {bool isInitialization = false}) async {
    contactInfo = 0;
    contactInfo = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(CONTACT_INFO, val);
    emit(AppStoreAllState());
  }

  Future<void> setTotalContactInfo(int val,
      {bool isInitialization = false}) async {
    totalContactInfo = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(TOTAL_CONTACT_INFO, val);
    emit(AppStoreAllState());
  }

  Future<void> setAddLimitCount(int val,
      {bool isInitialization = false}) async {
    addLimitCount = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(ADD_PROPERTY, val);
    emit(AppStoreAllState());
  }

  Future<void> setTotalAddLimitCount(int val,
      {bool isInitialization = false}) async {
    totalAddLimitCount = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(TOTAL_ADD_PROPERTY, val);
    emit(AppStoreAllState());
  }

  Future<void> setTotalAdvertisement(int val,
      {bool isInitialization = false}) async {
    totalAdvertisement = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(TOTAL_ADVERTISEMENT, val);
    emit(AppStoreAllState());
  }

  Future<void> setAdvertisement(int val,
      {bool isInitialization = false}) async {
    advertisement = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(ADVERTISEMENT, val);
    emit(AppStoreAllState());
  }

  Future<void> setSubscription(String val,
      {bool isInitialization = false}) async {
    subscription = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(subscriptions, val);
    emit(AppStoreAllState());
  }

  Future<void> addToRecentSearchList(String data) async {
    mRecentSearchList.add(data);
    emit(AppStoreAllState());
  }

  Future<void> setMinPrice(String val, {bool isInitialization = false}) async {
    minPrice = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(MIN_PRICE, val);
    emit(AppStoreAllState());
  }

  Future<void> setMaxPrice(String val, {bool isInitialization = false}) async {
    maxPrice = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(MAX_PRICE, val);
    emit(AppStoreAllState());
  }

  Future<void> storeSearchData() async {
    if (mRecentSearchList.isNotEmpty) {
      await SharedPreferencesManager.saveData(
          RECENT_SEARCH, jsonEncode(mRecentSearchList));
      log(SharedPreferencesManager.getStringAsync(RECENT_SEARCH));
    } else {
      await SharedPreferencesManager.saveData(RECENT_SEARCH, '');
    }
    emit(AppStoreAllState());
  }

  Future<void> clearSearchList(String item) async {
    mRecentSearchList.remove(item);
    emit(AppStoreAllState());
  }

  Future<void> setRecentSearch(String val,
      {bool isInitialization = false}) async {
    recentSearch = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(RECENT_SEARCH, val);
    emit(AppStoreAllState());
  }

  Future<void> setTermsCondition(String val,
      {bool isInitialization = false}) async {
    termsCondition = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(TermsCondition, val);
    emit(AppStoreAllState());
  }

  Future<void> setCurrencyCodeID(String val,
      {bool isInitialization = false}) async {
    currencySymbol = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(CurrencySymbol, val);
    emit(AppStoreAllState());
  }

  Future<void> setCurrencyCode(String val,
      {bool isInitialization = false}) async {
    currencyCode = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(CurrencyCode, val);
    emit(AppStoreAllState());
  }

  Future<void> setCurrencyPositionID(String val,
      {bool isInitialization = false}) async {
    currencyPosition = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(CurrencyPosition, val);
    emit(AppStoreAllState());
  }

  Future<void> setOneSignalAppID(String val,
      {bool isInitialization = false}) async {
    oneSignalAppID = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(OneSignalAppID, val);
    emit(AppStoreAllState());
  }

  Future<void> setOnesignalRestApiKey(String val,
      {bool isInitialization = false}) async {
    onesignalRestApiKey = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(OnesignalRestApiKey, val);
    emit(AppStoreAllState());
  }

  Future<void> setAdmobBannerId(String val,
      {bool isInitialization = false}) async {
    admobBannerId = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(AdmobBannerId, val);
    emit(AppStoreAllState());
  }

  Future<void> setAdmobInterstitialId(String val,
      {bool isInitialization = false}) async {
    admobInterstitialId = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(AdmobInterstitialId, val);
    emit(AppStoreAllState());
  }

  Future<void> setAdmobBannerIdIos(String val,
      {bool isInitialization = false}) async {
    admobBannerIdIos = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(AdmobBannerIdIos, val);
    emit(AppStoreAllState());
  }

  Future<void> setAdmobInterstitialIdIos(String val,
      {bool isInitialization = false}) async {
    admobInterstitialIdIos = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(AdmobInterstitialIdIos, val);
    emit(AppStoreAllState());
  }

  Future<void> setPrivacyPolicy(String val,
      {bool isInitialization = false}) async {
    privacyPolicy = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(PRIVACY_POLICY, val);
    emit(AppStoreAllState());
  }

  Future<void> setGender(String val, {bool isInitialization = false}) async {
    gender = val;
    if (!isInitialization) await SharedPreferencesManager.saveData(GENDER, val);
    emit(AppStoreAllState());
  }

  Future<void> setPhoneNo(String val, {bool isInitialization = false}) async {
    phoneNo = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(PHONE_NUMBER, val);
    emit(AppStoreAllState());
  }

  Future<void> setDisplayName(String val,
      {bool isInitialization = false}) async {
    displayName = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(DISPLAY_NAME, val);
    emit(AppStoreAllState());
  }

  Future<void> setUsername(String val, {bool isInitialization = false}) async {
    username = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(USERNAME, val);
    emit(AppStoreAllState());
  }

  Future<void> setToken(String val, {bool isInitialization = false}) async {
    token = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData("TOKEN", val);
    emit(AppStoreAllState());
  }

  Future<void> setUserImage(String val, {bool isInitialization = false}) async {
    profileImage = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(USER_PROFILE_IMG, val);
    emit(AppStoreAllState());
  }

  Future<void> setUserID(int val, {bool isInitialization = false}) async {
    userId = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(USER_ID, val);
    emit(AppStoreAllState());
  }

  Future<void> setFirstName(String val, {bool isInitialization = false}) async {
    fName = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(FIRSTNAME, val);
    emit(AppStoreAllState());
  }

  Future<void> setLastName(String val, {bool isInitialization = false}) async {
    lName = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(LASTNAME, val);
    emit(AppStoreAllState());
  }

  Future<void> setUserEmail(String val, {bool isInitialization = false}) async {
    email = val;
    if (!isInitialization) await SharedPreferencesManager.saveData(EMAIL, val);
    emit(AppStoreAllState());
  }

  Future<void> setUserPassword(String val,
      {bool isInitialization = false}) async {
    password = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(PASSWORD, val);
    emit(AppStoreAllState());
  }

  Future<void> setSubscriptionDetail(SubscriptionDetail val,
      {bool isInitialization = false}) async {
    subscriptionDetail = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(
          SUBSCRIPTION_DETAIL, jsonEncode(val));
    emit(AppStoreAllState());
  }

  Future<void> setUserDetail(UserResponse val,
      {bool isInitialization = false}) async {
    userResponse = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(USER_DETAIL, jsonEncode(val));
    emit(AppStoreAllState());
  }

  Future<void> setSubscribe(int val, {bool isInitialization = false}) async {
    isSubscribe = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(IS_SUBSCRIBE, val);
    emit(AppStoreAllState());
  }

  Future<void> setUserLatitude(String val,
      {bool isInitialization = false}) async {
    latitude = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(LATITUDE, val);
    emit(AppStoreAllState());
  }

  Future<void> setUserLongitude(String val,
      {bool isInitialization = false}) async {
    longitude = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(LONGITUDE, val);
    emit(AppStoreAllState());
  }

  Future<void> setUserCity(String val, {bool isInitialization = false}) async {
    cityName = val;
    if (!isInitialization) await SharedPreferencesManager.saveData(CITY, val);
    emit(AppStoreAllState());
  }

  Future<void> setUserPlayerId(String val,
      {bool isInitialization = false}) async {
    userPlayerId = val;
    if (!isInitialization)
      await SharedPreferencesManager.saveData(PLAYER_ID, val);
    emit(AppStoreAllState());
  }

  Future<void> clearUserData() async {
    fName = '';
    lName = '';
    profileImage = '';
    token = '';
    username = '';
    displayName = '';
    phoneNo = '';
    gender = '';
    age = '';
    emit(AppStoreAllState());
  }
}

@immutable
sealed class AppStoreState {}

final class AppStoreInitial extends AppStoreState {}

final class AppStoreAllState extends AppStoreState {}
