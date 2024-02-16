class Authors {
  List<Docs>? docs;

  Authors({this.docs});

  Authors.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(Docs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (docs != null) {
      data['docs'] = docs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Docs {
  String? type;
  String? name;
  String? birthDate;
  String? deathDate;
  String? topWork;
  int? workCount;
  List<String>? topSubjects;
  int? iVersion;

  Docs(
      {this.type,
      this.name,
      this.birthDate,
      this.topWork,
      this.workCount,
      this.topSubjects,
      this.iVersion,
      this.deathDate});

  Docs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    birthDate = json['birth_date'];
    topWork = json['top_work'];
    workCount = json['work_count'];
    topSubjects = json['top_subjects'].cast<String>();
    iVersion = json['_version_'];
    deathDate = json['death_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['birth_date'] = birthDate;
    data['top_work'] = topWork;
    data['work_count'] = workCount;
    data['top_subjects'] = topSubjects;
    data['_version_'] = iVersion;
    data['death_date'] = deathDate;
    return data;
  }
}
