// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prefrences _$PrefrencesFromJson(Map<String, dynamic> json) => Prefrences(
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$PrefrencesToJson(Prefrences instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
