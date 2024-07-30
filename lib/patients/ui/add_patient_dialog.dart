import 'package:hmis/main.dart';

class AddPatientDialog extends UI {
  const AddPatientDialog({
    super.key,
  });

  static final nameRM = Sparkle('');
  static final ageRM = Sparkle('20');

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: 'Add Patient'.text(),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'NAME',
              ),
              initialValue: nameRM(),
              onChanged: nameRM.set,
            ).pad(),
            TextFormField(
              initialValue: ageRM(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'AGE',
              ),
              onChanged: ageRM.set,
            ).pad(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ignore: unused_local_variable
                    final patient = Patient(
                      id: randomID,
                      name: nameRM(),
                      age: ageRM(),
                    );
                    Navigation(HomePage());
                    // RM.navigate.back(patient);
                  },
                  child: 'Save'.text(),
                ).pad(),
                ElevatedButton(
                  onPressed: () {
                    // RM.navigate.back();
                  },
                  child: 'Cancel'.text(),
                ).pad(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
