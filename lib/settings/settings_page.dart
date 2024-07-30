import 'package:hmis/main.dart';

import '../investigations/investigations_data.dart';

final themeModeRM = Sparkle(<ThemeMode>{ThemeMode.system});

ThemeMode get themeMode => themeModeRM().first;

class SettingsPage extends UI {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SegmentedButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            showSelectedIcon: false,
            segments: ThemeMode.values
                .map(
                  (e) => ButtonSegment(
                    value: e,
                    label: e.name.toUpperCase().text(),
                  ),
                )
                .toList(),
            selected: themeModeRM(),
            onSelectionChanged: themeModeRM.set,
          ).pad(),
          // Card(
          //   child: Center(child: 'HOSPITAL'.text().pad()),
          // ),
          // TextFormField(
          //   initialValue: settings.hospitalName,
          //   onChanged: setHospitalName,
          //   maxLength: 4,
          // ).pad(),
          FilledButton(
            onPressed: null,
            child: settingsBloc().hospitalName.text(),
          ).pad(),
          FilledButton(
            onPressed: patientsBloc.get == const Patients()
                ? null
                : () {
                    patientsBloc.set(
                      const Patients(),
                    );
                  },
            child: 'DELETE ALL'.text(textScaleFactor: 1.5).pad(),
          ).pad(),
          FilledButton(
            onPressed: investigationsBuiltIn
                    .every(investigationsBloc.get.cache.values.contains)
                ? null
                : () {
                    investigationsBuiltIn.forEach(investigationsBloc.add);
                  },
            child: 'Built-In Investigations'.text(textScaleFactor: 1.5).pad(),
          ).pad(),
        ],
      ),
    );
  }
}
