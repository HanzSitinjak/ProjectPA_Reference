import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ListMateri.dart';

class MyClass {
  final int id;
  final String name;

  MyClass({required this.id, required this.name});

  factory MyClass.fromJson(Map<String, dynamic> json) {
    return MyClass(
      id: json['id_kelas'],
      name: json['nama_kelas'],
    );
  }
}

class ListKelas extends StatefulWidget {
  @override
  _ListKelasState createState() => _ListKelasState();
}

class _ListKelasState extends State<ListKelas> {
  late Future<List<MyClass>> classesFuture;

  @override
  void initState() {
    super.initState();
    classesFuture = fetchClasses();
  }

  Future<List<MyClass>> fetchClasses() async {
    final response = await http.get(Uri.parse('http://192.168.102.42:8000/api/kelas'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<MyClass> classes = data.map((item) => MyClass.fromJson(item)).toList();
      return classes;
    } else {
      throw Exception('Failed to load classes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kelas'),
      ),
      body: FutureBuilder<List<MyClass>>(
        future: classesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                MyClass myClass = snapshot.data![index];
                return ListTile(
                  title: Text(myClass.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListMateri(className: myClass.name),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
