import 'dart:async';
import 'package:bayt_finder/screens/filter/filter_cubit.dart';
import 'package:bayt_finder/screens/home/cubit/home_cubit.dart';
import 'package:bayt_finder/screens/language/cubit/language_cubit.dart';
import 'package:bayt_finder/screens/layout/cubit/layout_cubit.dart';
import 'package:bayt_finder/screens/login/cubit/login_cubit.dart';
import 'package:bayt_finder/screens/sign_up/cubit/register_cubit.dart';
import 'package:bayt_finder/screens/sign_up/ubdet_state.dart';
import 'package:bayt_finder/screens/splash_screen/splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../store/AppStore.dart';
import '../utils/app_common.dart';
import '../utils/app_config.dart';
import '../utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../extensions/extension_util/string_extensions.dart';
import '../screens/no_internet_screen.dart';
import 'firebase_options.dart';

import 'local_storage/shared_preferences_manager.dart';
import 'models/dashBoard_response.dart';
import 'observer.dart';
import '../services/user_services.dart';
import 'app_theme.dart';
import 'extensions/common.dart';
import 'extensions/shared_pref.dart';
import 'extensions/system_utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

get getContext => navigatorKey.currentState;

get getContext1 => navigatorKey.currentState?.overlay?.context;
UserService userService = UserService();
AppStoreCubit appStore = AppStoreCubit();
late FilterConfiguration filterConfigurationMain;
late AppSetting appSettingMain;
//bool isCurrentlyOnNoInternet = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  });
  await SharedPreferencesManager.init();
  int themeModeIndex = SharedPreferencesManager.getIntAsync("themeMode",
      defaultValue: AppThemeMode().themeModeLight);
  if (themeModeIndex == AppThemeMode().themeModeLight) {
    appStore.setDarkMode(false);
  }
  else if (themeModeIndex == AppThemeMode().themeModeDark) {
    appStore.setDarkMode(true);
  }
  //setLogInValue();
  oneSignalData();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //////
  Bloc.observer = MyBlocObserver();
  SharedPreferencesManager.clear();
  runApp(EasyLocalization(
      path: "assets/translations",
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
      ],
      startLocale: Locale( SharedPreferencesManager.getStringAsync("local") ??"en"),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

/*  if (SharedPreferencesManager.getIntAsync("themeMode") == themeModeSystem) {
  appStore.setDarkMode(
  MediaQuery
      .of(context)
      .platformBrightness == Brightness.dark);
  }*/
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppStoreCubit>(create: (context) => AppStoreCubit()..init()),
          BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
          BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
          BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
          BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
          BlocProvider<FilterCubit>(create: (context) => FilterCubit()),
        ],
        child: BlocBuilder<AppStoreCubit, AppStoreState>(
          builder: (context, state) {
            appStore = AppStoreCubit.get(context); //
            return ScreenUtilInit(
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
                navigatorKey: navigatorKey,
                scrollBehavior: SBehavior(),
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
                themeMode: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
                title: 'Bayt Finder',
                home: SplashScreen(),
              ),
            );
          },
        ));
  }
}
