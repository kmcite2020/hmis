import 'package:hmis/main.dart';

import '../investigations/investigations_data.dart';

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
          Card(
            child: Center(child: 'HOSPITAL'.text().pad()),
          ),
          TextFormField(
            initialValue: hospitalName(),
            onChanged: hospitalName,
            maxLength: 4,
          ).pad(),
          FilledButton(
            onPressed: null,
            child: hospitalName().text(),
          ).pad(),
          FilledButton(
            onPressed: patients() == const Patients() ? null : () => patients(const Patients()),
            child: 'DELETE ALL'.text(textScaleFactor: 1.5).pad(),
          ).pad(),
          FilledButton(
            onPressed: iterableOfInvestigations.every(iterableOfInvestigations.contains)
                ? null
                : () => investigationsBuiltIn.forEach(addInvestigtaion),
            child: 'Built-In Investigations'.text(textScaleFactor: 1.5).pad(),
          ).pad(),
        ],
      ),
    );
  }
}
