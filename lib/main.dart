import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import './randomWords.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(primaryColor: Colors.purple[900]),
//         home: RandomWords());
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new MyHomePage(
        title: 'Users',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> _getUsers() async {
    var data = await http.get("https://naufalnibros.github.io/data.json");

    var jsonData = json.decode(data.body);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u["id"], u["name"], u[Leader], u["code"], u["fulldate"]);

      users.add(user);
    }

    print(users.length);

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading"),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return ListTile(
                    title: Text(snapshot.data[id].name),
                    subtitle: Text(snapshot.data[id].code),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Leader {
  final int id;
  final int tanggal;
  final String nama;
  final String bulan_tahun;
  final String status;
  final String nomor_surat;
  final String perihal;
  final String satker;

  Leader(
    this.id,
    this.tanggal,
    this.nama,
    this.bulan_tahun,
    this.status,
    this.nomor_surat,
    this.perihal,
    this.satker,
  );

  // factory Leader.fromJson(Map<String, dynamic> json) {
  //   return Leader(
  //       id: json['id'],
  //       tanggal: json['tanggal'],
  //       name: json['name'],
  //       bulan_tahun: json['bulan_tahun'],
  //       status: json['status'],
  //       nomor_surat: json['nomor_surat'],
  //       perihal: json['perihal'],
  //       satket: json['satket']);
  // }
}

class User {
  final String id;
  final String name;
  final Leader leader;
  final String code;
  final String fulldate;

  User(this.id, this.name, this.leader, this.code, this.fulldate);
}
