import '../main.dart';

class AddOrUpdatePatientEvent {
  final Patient patient;
  const AddOrUpdatePatientEvent(this.patient);
  String get id => patient.id;
}

class DeletePatientEvent {
  final Patient patient;
  const DeletePatientEvent(this.patient);
  String get id => patient.id;
}

Map<String, Patient> patientsRM(Map<String, Patient> state, action) {
  return switch (action) {
    AddOrUpdatePatientEvent() => Map.of(state)..[action.id] = action.patient,
    DeletePatientEvent() => Map.of(state)..remove(action.id),
    _ => state,
  };
}
