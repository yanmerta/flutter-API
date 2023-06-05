import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:wisata/model/wisata2.dart';

class ApiStatic {
  // static Future<List<Wisata>> getWisata() async {
  //   List<Wisata> wisata = [];
  //   for (var i = 0; i < 10; i++) {
  //     wisata.add(
  //       Wisata(
  //         nik: i,
  //         nama: "Nama Petani" + i.toString(),
  //         alamat: "Alamat",
  //         telp: "0369",
  //         foto: "Foto",
  //         idKelompokWisata: "ID Kelompok Wisata",
  //         status: "Status",
  //       )
  //     );
  //   }
  //   return wisata;
  // }

  static Future<List<Wisata>> getwisata() async {
    try {
      final response =
          await http.get(Uri.parse("http://192.168.56.1/api/wisata/"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Wisata> wisataList = [];
        for (var item in jsonData) {
          wisataList.add(Wisata.fromJson(item));
        }
        return wisataList;
      } else {
        throw Exception('Failed to fetch wisata');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
