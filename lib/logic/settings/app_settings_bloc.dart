import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, SettingsStateInitial> {
  AppSettingsBloc() : super(SettingsStateInitial(color: 4294918273)) {
    on<AppSettingsEvent>((event, emit) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      int? currentColor = await sp.getInt('app_color');

      if (currentColor==null/*  == '' || currentColor == 'null' */) {
        currentColor = 4294918273;
      }

      if (event is GetCurrentSettingsEvent) {
        emit.call(SettingsStateInitial(
          color: currentColor,
        ));
      } else if (event is colorChanged) {

        print('selected color:' + event.color.toString());

        sp.setInt('app_color',  event.color);
        emit.call(SettingsStateInitial(color: event.color));
      }
    });
  }
}
