import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../local_storage/shared_preferences_manager.dart';


part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  static LanguageCubit get(context) => BlocProvider.of(context);
  String selectedLanguage =SharedPreferencesManager.getStringAsync("local") ?? "en";
  void selectLanguage (String language){
    selectedLanguage = language;
    emit(LanguageSelectedState());
  }
//IND
}
