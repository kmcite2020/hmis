import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hmis/main.dart';
import 'package:uuid/uuid.dart';

export 'dart:convert';
export 'package:flex_color_scheme/flex_color_scheme.dart';
export 'package:flutter/material.dart' hide Actions;
export 'package:flutter_native_splash/flutter_native_splash.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:hmis/custom_app_bar.dart';
export 'package:hmis/home/home_page.dart';
export 'package:hmis/investigations/investigations.dart';
export 'package:hmis/investigations/investigations_page.dart';
export 'package:hmis/patients/patients.dart';
export 'package:hmis/patients/ui/add_patient_dialog.dart';
export 'package:hmis/patients/ui/patient_page.dart';
export 'package:hmis/patients/ui/patients_page.dart';
export 'package:hmis/settings/settings.dart';
export 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  await RM.storageInitializer(HiveStorge());
  runApp(App());
}

class App extends UI {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      home: HomePage(),
    );
  }
}

typedef UI = ReactiveStatelessWidget;

extension DynamicExtensions on dynamic {
  Text text({double textScaleFactor = 1}) {
    return Text(
      toString(),
      textScaler: TextScaler.linear(textScaleFactor),
    );
  }
}

extension WidgetExtensions on Widget {
  Padding pad({
    double? all,
    double? right,
    double? left,
    double? top,
    double? bottom,
    double? horizontal,
    double? vertical,
  }) {
    EdgeInsetsGeometry edgeInsets = EdgeInsets.zero;

    if (all != null) {
      edgeInsets = EdgeInsets.all(all);
    } else if (horizontal != null || vertical != null) {
      edgeInsets = EdgeInsets.symmetric(
        vertical: vertical ?? 0.0,
        horizontal: horizontal ?? 0.0,
      );
    } else if (right != null || left != null || top != null || bottom != null) {
      edgeInsets = EdgeInsets.only(
        left: left ?? 0.0,
        right: right ?? 0.0,
        top: top ?? 0.0,
        bottom: bottom ?? 0.0,
      );
    } else {
      edgeInsets = EdgeInsets.all(8.0);
    }

    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }

  Widget center() => Center(child: this);
  Card card() => Card(child: this);
}

String get randomID => Uuid().v8();

PersistState<T> persisted<T>(
  String key,
  FutureOr<T> Function(Map<String, dynamic> json)? fromJson,
) {
  return PersistState(
    key: key,
    toJson: jsonEncode,
    fromJson: (json) => fromJson!.call(jsonDecode(json)),
  );
}

final navigator = RM.navigate;

class HiveStorge implements IPersistStore {
  late final Box box;

  @override
  Future<void> delete(String key) => box.delete(key);

  @override
  Future<void> deleteAll() => box.clear();

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('hmis');
  }

  @override
  Object? read(String key) {
    return box.get(key);
  }

  @override
  Future<void> write<T>(String key, T value) => box.put(key, value);
}
