import 'package:manager/persistent_spark.dart';

import '../main.dart';

final SettingsBloc settingsBloc = SettingsBloc(
  Settings(),
  key: "Settings",
  fromJson: Settings.fromJson,
);

class SettingsBloc extends PersistentSparkle<Settings> {
  SettingsBloc(
    super.initialState, {
    required super.key,
    required super.fromJson,
  });

  void themeMode(themeMode) {
    set(get.copyWith(themeMode: themeMode));
  }

  void hospitalName(hospitalName) {
    set(get.copyWith(hospitalName: hospitalName));
  }

  void userName(userName) => set(get.copyWith(userName: userName));
}
