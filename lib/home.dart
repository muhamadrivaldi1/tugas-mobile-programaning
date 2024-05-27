import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 175, 15, 127),
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 5, // Space between columns
          mainAxisSpacing: 5, // Space between rows
          children: <Widget>[
            buildDashboardButton(context, '/input-data-jenis', 'Input Data Jenis Layanan', Icons.list, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/input-data-kategori', 'Input Data Kategori Layanan', Icons.category, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/input-data-pelanggan', 'Input Data Pelanggan', Icons.person, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/input-data-projek', 'Input Data Proyek', Icons.work, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/input-data-transaksi', 'Input Data Transaksi', Icons.money, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/input-data-terima-hasil', 'Input Data Terima Hasil', Icons.receipt, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/input-data-kuitansi', 'Input Data Kuitansi', Icons.receipt_long, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/input-data-hasil-uji', 'Input Data Hasil Uji', Icons.science, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/data-master-transaksi', 'Data Master & Transaksi', Icons.data_usage, const Color.fromARGB(255, 175, 15, 127)),
            buildDashboardButton(context, '/laporan-data-transaksi', 'Laporan Data Transaksi', Icons.report, const Color.fromARGB(255, 175, 15, 127)),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardButton(BuildContext context, String route, String text, IconData icon, Color backgroundColor, {Color textColor = Colors.white}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: textColor,
              ),
              const SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
