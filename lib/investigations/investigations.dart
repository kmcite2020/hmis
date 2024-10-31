import '../main.dart';

part 'investigations.freezed.dart';
part 'investigations.g.dart';

@freezed
class Investigation with _$Investigation {
  const factory Investigation({
    @Default('') final String id,
    @Default('') final String name,
    @Default(200) final int price,
  }) = _Investigation;

  factory Investigation.fromJson(Map<String, dynamic> json) => _$InvestigationFromJson(json);
}

@freezed
class Investigations with _$Investigations {
  const factory Investigations({
    @Default(<String, Investigation>{}) final Map<String, Investigation> cache,
  }) = _Investigations;

  factory Investigations.fromJson(Map<String, dynamic> json) => _$InvestigationsFromJson(json);
}

final investigationsRM = RM.inject(
  () => Investigations(),
  persist: () => persisted('investigations', Investigations.fromJson),
);

Investigations investigations([_]) {
  if (_ != null) investigationsRM.state = _;
  return investigationsRM.state;
}

Map<String, Investigation> mapOfInvestigations([Map<String, Investigation>? _investigation]) {
  if (_investigation != null) investigations(investigations().copyWith(cache: _investigation));
  return investigations().cache;
}

Iterable<Investigation> get iterableOfInvestigations => mapOfInvestigations().values;

addInvestigtaion(Investigation i) => mapOfInvestigations(Map.of(mapOfInvestigations())..[i.id] = i);
removeInvestigtaion(String id) => mapOfInvestigations(Map.of(mapOfInvestigations())..remove(id));
clearInvestigtaions() => mapOfInvestigations({});
