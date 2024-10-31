import 'package:hmis/main.dart';

import '../settings/settings_page.dart';

class HomePage extends UI {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const SizedBox(),
        title: 'HMIS',
      ),
      body: Stack(
        children: [
          const Opacity(
            opacity: .3,
            child: Align(
              child: FaIcon(
                FontAwesomeIcons.hospital,
                size: 150,
              ),
            ),
          ),
          Opacity(
            opacity: 0.4,
            child: Align(
              child: hospitalName().text(),
            ),
          ),
          Opacity(
            opacity: .9,
            child: ListView(
              children: [
                FilledButton.icon(
                  onPressed: () {
                    navigator.to(PatientsPage());
                  },
                  icon: const Icon(FontAwesomeIcons.route),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: 'Patients'.text(textScaleFactor: 2).pad(),
                  ),
                ).pad(),
                FilledButton.icon(
                  onPressed: () {
                    navigator.to(InvestigationsPage());
                  },
                  icon: const Icon(FontAwesomeIcons.fileInvoice),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: 'Investigations'.text(textScaleFactor: 2).pad(),
                  ),
                ).pad(),
                FilledButton.icon(
                  onPressed: () {
                    navigator.to(SettingsPage());
                  },
                  icon: const Icon(FontAwesomeIcons.confluence),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: 'Settings'.text(textScaleFactor: 2).pad(),
                  ),
                ).pad(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
