import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LaporanDataTransaksiPage extends StatefulWidget {
  @override
  _LaporanDataTransaksiPageState createState() => _LaporanDataTransaksiPageState();
}

class _LaporanDataTransaksiPageState extends State<LaporanDataTransaksiPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != initialDate) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _showResults(BuildContext context) {
    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih kedua tanggal')),
      );
      return;
    }

    // Dummy data to represent the results
    String results = 'Hasil Transaksi dari ${DateFormat('dd/MM/yyyy').format(_startDate!)} '
        'hingga ${DateFormat('dd/MM/yyyy').format(_endDate!)}';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hasil Cetak'),
          content: Text(results),
          actions: [
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Data Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'TANGGAL AWAL',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context, true),
              child: AbsorbPointer(
                child: TextField(
                  controller: TextEditingController(
                    text: _startDate == null ? '' : DateFormat('dd/MM/yyyy').format(_startDate!),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Pilih Tanggal Awal',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'TANGGAL AKHIR',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: AbsorbPointer(
                child: TextField(
                  controller: TextEditingController(
                    text: _endDate == null ? '' : DateFormat('dd/MM/yyyy').format(_endDate!),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Pilih Tanggal Akhir',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _showResults(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 175, 15, 127),
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Cetak',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}