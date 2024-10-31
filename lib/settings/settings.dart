import 'package:hmis/main.dart';
part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Settings with _$Settings {
  const Settings._();
  const factory Settings({
    @Default(ThemeMode.system) final ThemeMode themeMode,
    @Default('') final String hospitalName,
    @Default('') final String userName,
  }) = _Settings;

  factory Settings.fromJson(json) => _$SettingsFromJson(json);
}

final settingsRM = RM.inject(
  () => Settings(),
  persist: () => persisted('settings', Settings.fromJson),
);

Settings settings([Settings? _]) {
  if (_ != null) settingsRM.state = _;
  return settingsRM.state;
}

ThemeMode themeMode([ThemeMode? _]) {
  if (_ != null) settings(settings().copyWith(themeMode: _));
  return settings().themeMode;
}

String hospitalName([String? _]) {
  if (_ != null) settings(settings().copyWith(hospitalName: _));
  return settings().hospitalName;
}

String userName([String? _]) {
  if (_ != null) settings(settings().copyWith(userName: _));
  return settings().userName;
}
