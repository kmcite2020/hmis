import 'package:hmis/main.dart';

final idRM = Sparkle('');
setId(String i) => idRM.set(i);

class PatientsPage extends UI {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Patients',
        onDoubleTap: () async {
          // final patient =
          //     await RM.navigate.toDialog<Patient>(const AddPatientDialog());
          // if (patient != null) {
          //   patientsBloc.add(patient);
          // }
        },
      ),
      body: patientsBloc.get.cache.isEmpty
          ? Align(
              child: const FaIcon(
                FontAwesomeIcons.peopleGroup,
                size: 150,
              ).pad(),
            )
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: patientsBloc.get.cache.entries.map(
                (patientEntry) {
                  final patient = patientEntry.value;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: patient.age.text(),
                      ),
                      onTap: () {
                        setId(patient.id);
                        Navigation(PatientPage(
                          id: idRM(),
                        ));
                      },
                      title: patient.name.text(textScaleFactor: 1.2),
                      selected: patient.id == idRM(),
                    ),
                  );
                },
              ).toList(),
            ),
    );
  }
}
