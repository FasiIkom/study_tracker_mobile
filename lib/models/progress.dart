import 'dart:convert';

List<Progress> progressFromJson(String str) => List<Progress>.from(json.decode(str).map((x) => Progress.fromJson(x)));

String progressToJson(List<Progress> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Progress {
    String model;
    int pk;
    Fields fields;

    Progress({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String subject;
    String catatan;
    String startStudy;
    int progress;
    DateTime dateAdded;
    int user;

    Fields({
        required this.subject,
        required this.catatan,
        required this.startStudy,
        required this.progress,
        required this.dateAdded,
        required this.user,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        subject: json["subject"],
        catatan: json["catatan"],
        startStudy: json["start_Study"],
        progress: json["progress"],
        dateAdded: DateTime.parse(json["date_added"]),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "subject": subject,
        "catatan": catatan,
        "start_Study": startStudy,
        "progress": progress,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "user": user,
    };
}