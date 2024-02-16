import 'package:equatable/equatable.dart';

final class Authors with EquatableMixin {
  final int? numFound;
  final int? start;
  final bool? numFoundExact;
  final List<Docs>? docs;

  const Authors({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
  });

  @override
  List<Object?> get props => [numFound, start, numFoundExact, docs];

  Authors copyWith({
    int? numFound,
    int? start,
    bool? numFoundExact,
    List<Docs>? docs,
  }) {
    return Authors(
      numFound: numFound ?? this.numFound,
      start: start ?? this.start,
      numFoundExact: numFoundExact ?? this.numFoundExact,
      docs: docs ?? this.docs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numFound': numFound,
      'start': start,
      'numFoundExact': numFoundExact,
      'docs': docs,
    };
  }

  factory Authors.fromJson(Map<String, dynamic> json) {
    return Authors(
      numFound: json['numFound'] as int?,
      start: json['start'] as int?,
      numFoundExact: json['numFoundExact'] as bool?,
      docs: (json['docs'] as List<dynamic>?)?.map((e) => Docs.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class Docs with EquatableMixin {
  final String? key;
  final String? type;
  final String? name;
  final List<String>? alternateNames;
  final String? birthDate;
  final String? deathDate;
  final String? topWork;
  final int? workCount;
  final List<String>? topSubjects;
  final int? version;

  const Docs({
    this.key,
    this.type,
    this.name,
    this.alternateNames,
    this.birthDate,
    this.deathDate,
    this.topWork,
    this.workCount,
    this.topSubjects,
    this.version,
  });

  @override
  List<Object?> get props =>
      [key, type, name, alternateNames, birthDate, deathDate, topWork, workCount, topSubjects, version];

  Docs copyWith({
    String? key,
    String? type,
    String? name,
    List<String>? alternateNames,
    String? birthDate,
    String? deathDate,
    String? topWork,
    int? workCount,
    List<String>? topSubjects,
    int? version,
  }) {
    return Docs(
      key: key ?? this.key,
      type: type ?? this.type,
      name: name ?? this.name,
      alternateNames: alternateNames ?? this.alternateNames,
      birthDate: birthDate ?? this.birthDate,
      deathDate: deathDate ?? this.deathDate,
      topWork: topWork ?? this.topWork,
      workCount: workCount ?? this.workCount,
      topSubjects: topSubjects ?? this.topSubjects,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'type': type,
      'name': name,
      'alternate_names': alternateNames,
      'birth_date': birthDate,
      'death_date': deathDate,
      'top_work': topWork,
      'work_count': workCount,
      'top_subjects': topSubjects,
      '_version_': version,
    };
  }

  factory Docs.fromJson(Map<String, dynamic> json) {
    return Docs(
      key: json['key'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      alternateNames: (json['alternate_names'] as List<dynamic>?)?.map((e) => e as String).toList(),
      birthDate: json['birth_date'] as String?,
      deathDate: json['death_date'] as String?,
      topWork: json['top_work'] as String?,
      workCount: json['work_count'] as int?,
      topSubjects: (json['top_subjects'] as List<dynamic>?)?.map((e) => e as String).toList(),
      version: json['_version_'] as int?,
    );
  }
}
