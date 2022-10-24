import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prefences.g.dart';

/// generate command: flutter packages pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Prefrences {
  static const THEME_MODE_DEFOULT_VALUE = ThemeMode.system;

  /// default values for prefrences
  @JsonKey(defaultValue: THEME_MODE_DEFOULT_VALUE)
  final ThemeMode themeMode;

  Prefrences(
    this.themeMode,
  );

  factory Prefrences.fromJson(Map<String, dynamic> json) =>
      _$PrefrencesFromJson(json);

  Map<String, dynamic> toJson() => _$PrefrencesToJson(this);

  //defoul values factory
  factory Prefrences.defaultValues() => Prefrences(THEME_MODE_DEFOULT_VALUE);

  //copywith

  Prefrences copyWith({
    ThemeMode? themeMode,
  }) {
    return Prefrences(
      themeMode ?? this.themeMode,
    );
  }

  //equals
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Prefrences &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode;

  @override
  int get hashCode => themeMode.hashCode;

  @override
  String toString() {
    return 'Prefences{themeMode: $themeMode}';
  }
}
