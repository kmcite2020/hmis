import 'package:hmis/main.dart';

// setId(String i) => idRM.set(i);

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
      body: iterableOfpatients.isEmpty
          ? Align(
              child: const FaIcon(
                FontAwesomeIcons.peopleGroup,
                size: 150,
              ).pad(),
            )
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: iterableOfpatients.map(
                (patient) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: patient.age.text(),
                      ),
                      onTap: () {
                        // setId(patient.id);
                        // Navigation(PatientPage(
                        //   id: idRM(),
                        // ));
                      },
                      title: patient.name.text(textScaleFactor: 1.2),
                      // selected: patient.id == idRM(),
                    ),
                  );
                },
              ).toList(),
            ),
    );
  }
}
