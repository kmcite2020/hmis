import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manager/persistent_spark.dart';

part 'investigations.freezed.dart';
part 'investigations.g.dart';

@freezed
class Investigation with _$Investigation {
  const factory Investigation({
    @Default('') final String id,
    @Default('') final String name,
    @Default(200) final int price,
  }) = _Investigation;

  factory Investigation.fromJson(Map<String, dynamic> json) =>
      _$InvestigationFromJson(json);
}

@freezed
class Investigations with _$Investigations {
  const factory Investigations({
    @Default(<String, Investigation>{}) final Map<String, Investigation> cache,
  }) = _Investigations;

  factory Investigations.fromJson(Map<String, dynamic> json) =>
      _$InvestigationsFromJson(json);
}

final investigationsBloc = InvestigationsBloc(
  Investigations(),
  key: 'investigations',
  fromJson: Investigations.fromJson,
);

class InvestigationsBloc extends PersistentSparkle<Investigations> {
  InvestigationsBloc(super.initialState,
      {required super.key, required super.fromJson});

  add(Investigation investigation) {
    set(
      get.copyWith(
          cache: Map.of(get.cache)..[investigation.id] = investigation),
    );
  }

  void remove(String id) {
    set(
      get.copyWith(cache: Map.of(get.cache)..remove(id)),
    );
  }

  void clear() => set(get.copyWith(cache: {}));
}
