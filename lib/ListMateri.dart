import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListMateri extends StatelessWidget {
  final String className;

  ListMateri({required this.className});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Materi - $className'),
      ),
      body: FutureBuilder(
        future: fetchMateri(className),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Handle response data here
          List<dynamic> materiData = snapshot.data as List<dynamic>;
          return ListView.builder(
            itemCount: materiData.length,
            itemBuilder: (context, index) {
              var materi = materiData[index];
              return ListTile(
                title: Text(materi['nama_materi']),
                subtitle: Text(materi['deskripsi']),
                // Tambahkan onTap jika diperlukan
              );
            },
          );
        },
      ),
    );
  }

  Future fetchMateri(String className) async {
    final response = await http.get(Uri.parse('http://192.168.102.42:8000/api/tampil-materi/$className'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load materi');
    }
  }
}
