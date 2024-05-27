// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'inputdatajenis.dart';
import 'inputdatakategorilayanan.dart';
import 'inputdatapelanggan.dart';
import 'inputdataprojek.dart';
import 'inputdatatransaksi.dart';
import 'inputdatahasiluji.dart';
import 'inputdatakuitansi.dart';
import 'inputdataterimahasiltest.dart'; 
import 'DataMasterTransaksi.dart';
import 'laporandatatransaksi.dart'; // Tambahkan ini untuk sambungan 'Laporan Data Transaksi'

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/input-data-jenis': (context) => InputDataJenisPage(),
        '/input-data-kategori': (context) => InputDataKategoriLayananPage(),
        '/input-data-pelanggan': (context) => InputDataPelangganPage(),
        '/input-data-projek': (context) => InputDataProjekPage(),
        '/input-data-transaksi': (context) => InputDataTransaksiPage(),
        '/input-data-hasil-uji': (context) => InputDataHasilUjiPage(),
        '/input-data-kuitansi': (context) => InputDataKuitansiPage(),
        '/input-data-terima-hasil': (context) => InputDataTerimaHasilTestPage(),
        '/data-master-transaksi': (context) => DataMasterTransaksiPage(),
        '/laporan-data-transaksi': (context) => LaporanDataTransaksiPage(), // Sambungan 'Laporan Data Transaksi'
      },
    );
  }
}
