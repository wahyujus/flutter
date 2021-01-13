// // To parse this JSON data, do
// //
// //     final users = usersFromJson(jsonString);

// import 'dart:convert';

// List<Users> usersFromJson(String str) =>
//     List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

// String usersToJson(List<Users> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class User {
//   User({
//     this.id,
//     this.name,
//     this.leader,
//     this.code,
//     this.fulldate,
//   });

//   String id;
//   String name;
//   Leader leader;
//   String code;
//   DateTime fulldate;

//   factory Users.fromJson(Map<String, dynamic> json) => Users(
//         id: json["id"],
//         name: json["name"],
//         leader: Leader.fromJson(json["leader"]),
//         code: json["code"],
//         fulldate: DateTime.parse(json["fulldate"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "leader": leader.toJson(),
//         "code": code,
//         "fulldate": fulldate.toIso8601String(),
//       };
// }

// class Leader {
//   Leader({
//     this.id,
//     this.tanggal,
//     this.name,
//     this.bulanTahun,
//     this.status,
//     this.nomorSurat,
//     this.perihal,
//     this.satker,
//   });

//   int id;
//   int tanggal;
//   String name;
//   String bulanTahun;
//   String status;
//   String nomorSurat;
//   String perihal;
//   String satker;

//   factory Leader.fromJson(Map<String, dynamic> json) => Leader(
//         id: json["id"],
//         tanggal: json["tanggal"],
//         name: json["name"],
//         bulanTahun: json["bulan_tahun"],
//         status: json["status"],
//         nomorSurat: json["nomor_surat"],
//         perihal: json["perihal"],
//         satker: json["satker"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "tanggal": tanggal,
//         "name": name,
//         "bulan_tahun": bulanTahun,
//         "status": status,
//         "nomor_surat": nomorSurat,
//         "perihal": perihal,
//         "satker": satker,
//       };
// }
