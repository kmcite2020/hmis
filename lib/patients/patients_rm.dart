import 'package:manager/persistent_spark.dart';

import '../main.dart';

final PatientsBloc patientsBloc = PatientsBloc(
  Patients(),
  key: "Patients",
  fromJson: Patients.fromJson,
);

class PatientsBloc extends PersistentSparkle<Patients> {
  PatientsBloc(
    super.initialState, {
    required super.key,
    required super.fromJson,
  });
  void add(Patient patient) {
    set(
      get.copyWith(
        cache: Map.of(get.cache)..[patient.id] = patient,
      ),
    );
  }

  void remove(String id) {
    set(
      get.copyWith(
        cache: Map.of(get.cache)..remove(id),
      ),
    );
  }
}
