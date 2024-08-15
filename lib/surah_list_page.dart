import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SurahListPage extends StatefulWidget {
  const SurahListPage({super.key});

  @override
  State<SurahListPage> createState() => _SurahListPageState();
}

class _SurahListPageState extends State<SurahListPage> {
  late Future<Map<String, dynamic>> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Surat")),
      body: FutureBuilder<Map<String, dynamic>>(
        future: jsonData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return Text("data");
          }
          return const Text("No Data");
        },
      ),
    );
  }

  Future<Map<String, dynamic>> loadJsonData() async {
    // Membaca file JSON dari assets
    final jsonString =
        await rootBundle.loadString('assets/jsons/surah_list.json');

    // Mengonversi JSON string menjadi Map
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;

    return jsonData;
  }
}
