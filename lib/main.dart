import 'dart:async';
import 'dart:developer';
import 'package:bayt_finder/nav.dart';
import 'package:bayt_finder/screens/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:bayt_finder/screens/favourite/cubit/favourite_cubit.dart';
import 'package:bayt_finder/screens/filter/cubit/filter_cubit.dart';
import 'package:bayt_finder/screens/google_map/cubit/google_map_cubit.dart';
import 'package:bayt_finder/screens/home/cubit/home_cubit.dart';
import 'package:bayt_finder/screens/language/cubit/language_cubit.dart';
import 'package:bayt_finder/screens/layout/cubit/layout_cubit.dart';
import 'package:bayt_finder/screens/login/cubit/login_cubit.dart';
import 'package:bayt_finder/screens/map/cubit/show_property_in_map_cubit.dart';
import 'package:bayt_finder/screens/my_account/cubit/my_account_cubit.dart';
import 'package:bayt_finder/screens/my_property/cubit/my_property_cubit.dart';
import 'package:bayt_finder/screens/news/cubit/news_cubit.dart';
import 'package:bayt_finder/screens/no_internet_screen.dart';
import 'package:bayt_finder/screens/property/cubit/property_cubit.dart';
import 'package:bayt_finder/screens/sign_up/cubit/register_cubit.dart';
import 'package:bayt_finder/screens/splash_screen/splash_screen.dart';
import 'package:bayt_finder/screens/top_agencies/cubit/top_agencies_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_common.dart';
import '../utils/constants.dart';

import 'appcontext.dart';
import 'firebase_options.dart';
import 'local_storage/shared_preferences_manager.dart';
import 'models/dashBoard_response.dart';
import 'observer.dart';
import 'app_theme.dart';

late FilterConfiguration filterConfigurationMain;
late AppSetting appSettingMain;
late bool isLogin;
late int userId;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesManager.init();
  //SharedPreferencesManager.clear();
  isLogin = SharedPreferencesManager.getBoolAsync(AppConstants.isLogin);
  userId = SharedPreferencesManager.getIntAsync(AppConstants.userId);

  oneSignalData();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
      path: "assets/translations",
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
      ],
      startLocale:
      Locale(
          SharedPreferencesManager.getStringAsync(AppConstants.local) ?? "en"),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCurrentlyOnNoInternet = false;

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    init();
  }
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
      log('Couldn\'t check connectivity status${e.message!}');
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (!mounted) return;
    setState(() {

      _connectionStatus = result;
    });
    if (_connectionStatus.contains(ConnectivityResult.none)) {
      log('not connected');
      isCurrentlyOnNoInternet = true;
      navigateFinish( NoInternetScreen());
    } else {
      if (isCurrentlyOnNoInternet) {
        navigateBack(AppContext.context);
        isCurrentlyOnNoInternet = false;
      }
      log('connected');
    }
    print("_connectionStatus--> $_connectionStatus");
  }
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
    _connectivitySubscription.cancel();
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
          BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
          BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
          BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
          BlocProvider<FilterCubit>(create: (context) => FilterCubit()),
          BlocProvider<PropertyCubit>(create: (context) => PropertyCubit()),
          BlocProvider<MyAccountCubit>(create: (context) => MyAccountCubit()),
          BlocProvider<FavouriteCubit>(create: (context) => FavouriteCubit()),
          BlocProvider<MyPropertyCubit>(create: (context) => MyPropertyCubit()),
          BlocProvider<EditProfileCubit>(create: (context) => EditProfileCubit()),
          BlocProvider<TopAgenciesCubit>(create: (context) => TopAgenciesCubit()),
          BlocProvider<NewsCubit>(create: (context) => NewsCubit()),
          BlocProvider<GoogleMapCubit>(create: (context) => GoogleMapCubit()),
          BlocProvider<ShowPropertyInMapCubit>(create: (context) => ShowPropertyInMapCubit()),
        ],
        child:  ScreenUtilInit(
        designSize: const Size(432, 932),
    minTextAdapt: true,
    splitScreenMode: true,
    child: MaterialApp(
    builder: (context, child) {
    return MediaQuery(
    data: MediaQuery.of(context).copyWith(
    textScaler: const TextScaler.linear(1.0),
    ),
    child: child!,
    );
    },
    navigatorKey: AppContext.navigatorKey,
    localizationsDelegates: context.localizationDelegates,
    supportedLocales: context.supportedLocales,
    locale: context.locale,
    theme: AppTheme.lightTheme,
    //darkTheme: AppTheme.darkTheme,
    debugShowCheckedModeBanner: false,
    themeMode:ThemeMode.light,
    //appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
    title: 'Bayt Finder',
    home: SplashScreen(),
    ),
    ));
  }
}



