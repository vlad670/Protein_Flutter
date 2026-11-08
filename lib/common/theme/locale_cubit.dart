import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit() : super(null);

  void toggleLocale() {
    if (state == null) {
      emit(const Locale('ru')); 
    } else if (state?.languageCode == 'ru') {
      emit(const Locale('en')); 
    } else {
      emit(null); 
    }
  }
}