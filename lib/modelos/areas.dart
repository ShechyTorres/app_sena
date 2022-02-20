// To parse this JSON data, do
//
//     final areas = areasFromJson(jsonString);

import 'dart:convert';

List<Areas> areasFromJson(String str) => List<Areas>.from(json.decode(str).map((x) => Areas.fromJson(x)));

String areasToJson(List<Areas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Areas {
    Areas({
        this.idAreas,
        this.urlAreas,
        this.titleAreas,
        this.contentAreas,
    });

    int idAreas;
    String urlAreas;
    String titleAreas;
    List<ContentArea> contentAreas;

    factory Areas.fromJson(Map<String, dynamic> json) => Areas(
        idAreas: json["idAreas"],
        urlAreas: json["urlAreas"],
        titleAreas: json["titleAreas"],
        contentAreas: List<ContentArea>.from(json["contentAreas"].map((x) => ContentArea.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idAreas": idAreas,
        "urlAreas": urlAreas,
        "titleAreas": titleAreas,
        "contentAreas": List<dynamic>.from(contentAreas.map((x) => x.toJson())),
    };
}

class ContentArea {
    ContentArea({
        this.idProgram,
        this.titleProgram,
        this.contentProgram,
    });

    int idProgram;
    String titleProgram;
    ContentProgram contentProgram;

    factory ContentArea.fromJson(Map<String, dynamic> json) => ContentArea(
        idProgram: json["idProgram"],
        titleProgram: json["titleProgram"],
        contentProgram: ContentProgram.fromJson(json["contentProgram"]),
    );

    Map<String, dynamic> toJson() => {
        "idProgram": idProgram,
        "titleProgram": titleProgram,
        "contentProgram": contentProgram.toJson(),
    };
}

class ContentProgram {
    ContentProgram({
        this.nameDescription,
        this.contentDescription,
    });

    String nameDescription;
    String contentDescription;

    factory ContentProgram.fromJson(Map<String, dynamic> json) => ContentProgram(
        nameDescription: json["nameDescription"],
        contentDescription: json["contentDescription"],
    );

    Map<String, dynamic> toJson() => {
        "nameDescription": nameDescription,
        "contentDescription": contentDescription,
    };
}
