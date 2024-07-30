import 'package:hmis/main.dart';
export 'package:flutter/material.dart';

export 'dart:convert';

export 'package:flex_color_scheme/flex_color_scheme.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:hmis/custom_app_bar.dart';
export 'package:hmis/home/home_page.dart';
export 'package:hmis/investigations/investigations.dart';
export 'package:hmis/investigations/investigations_page.dart';
export 'package:hmis/patients/patients.dart';
export 'package:hmis/patients/patients_rm.dart';
export 'package:hmis/patients/ui/add_patient_dialog.dart';
export 'package:hmis/patients/ui/patient_page.dart';
export 'package:hmis/patients/ui/patients_page.dart';
export 'package:hmis/settings/settings.dart';
export 'package:hmis/settings/settings_page.dart';
export 'package:hmis/settings/settings_rm.dart';
export 'package:manager/manager.dart';

final navigationRM = Sparkle<Widget>(HomePage());

class Navigation {
  Navigation(Widget page) {
    navigationRM(page);
  }
}

void main() => appRunner(App());

class App extends TopUI {
  @override
  Widget get navigation {
    FlutterNativeSplash.remove();
    return navigationRM();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return OnReactive(
  //     () => MaterialApp(
  //       navigatorKey: RM.navigate.navigatorKey,
  //       debugShowCheckedModeBanner: false,
  //       themeAnimationDuration: animationDuration,
  //       theme: FlexThemeData.light(
  //         useMaterial3: true,
  //         subThemesData: const FlexSubThemesData(defaultRadius: 5),
  //       ),
  //       darkTheme: FlexThemeData.dark(
  //         useMaterial3: true,
  //         subThemesData: const FlexSubThemesData(defaultRadius: 5),
  //       ),
  //       themeMode: themeMode,
  //       home: PopScope(
  //         canPop: false,
  //         child: AnimatedContainer(
  //           duration: animationDuration,
  //           child: switch (mainPages) {
  //             MainPages.home => const HomePage(),
  //             MainPages.patients => const PatientsPage(),
  //             MainPages.investigations => const InvestigationsPage(),
  //             MainPages.settings => const SettingsPage(),
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
