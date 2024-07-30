import 'package:hmis/main.dart';

class PatientPage extends UI {
  const PatientPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final patient = Patient.get(id: id);
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            // patientsPagesRM.state = (PatientsPages.list);
          },
          icon: const FaIcon(
            FontAwesomeIcons.heartPulse,
          ),
        ),
        title: patient.name,
      ),
      body: Column(
        children: [
          'NAME'.text(),
          TextFormField(
            initialValue: patient.name,
            onChanged: (name) {
              patientsBloc.add(
                patient.copyWith(name: name),
              );
            },
          ).pad(),
          'AGE'.text(),
          TextFormField(
            initialValue: patient.age,
            onChanged: (age) {
              Future(
                () {
                  return 0;
                },
              ).then(
                (value) {
                  return value;
                },
              );
              patientsBloc.add(
                patient.copyWith(age: age),
              );
            },
          ).pad(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              'INVESTIGATIONS'.text().pad(),
              PopupMenuButton(
                onSelected: (investigation) {
                  if (patient.investigations.contains(investigation)) {
                    patientsBloc.add(
                      patient.copyWith(
                        investigations: List.of(patient.investigations)
                          ..remove(investigation),
                      ),
                    );
                  } else {
                    patientsBloc.add(
                      patient.copyWith(
                        investigations: List.of(patient.investigations)
                          ..add(investigation),
                      ),
                    );
                  }
                },
                itemBuilder: (_) => investigationsBloc.get.cache.values.map(
                  (value) {
                    return PopupMenuItem(
                      value: value,
                      child: Row(
                        children: [
                          if (patient.investigations.contains(value))
                            const Icon(Icons.done).pad()
                          else
                            const Icon(Icons.cancel).pad(),
                          value.name.text(),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ).pad(),
            ],
          ),
          Wrap(
            children: patient.investigations
                .map(
                  (eachInvestigaion) => Chip(
                    labelPadding: const EdgeInsets.all(1),
                    label: eachInvestigaion.name.text(),
                    onDeleted: () {
                      patientsBloc.add(
                        patient.copyWith(
                          investigations: List.of(patient.investigations)
                            ..remove(eachInvestigaion),
                        ),
                      );
                    },
                  ).pad(all: 2),
                )
                .toList(),
          ),
          patient.bills.text(textScaleFactor: 3),
        ],
      ),
    );
  }
}
