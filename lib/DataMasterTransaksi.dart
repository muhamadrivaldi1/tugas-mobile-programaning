import 'package:flutter/material.dart';

class DataMasterTransaksiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Master & Data Transaksi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildSectionTitle('DATA MASTER'),
          _buildDataMasterTable(context),
          const SizedBox(height: 20),
          _buildSectionTitle('DATA TRANSAKSI'),
          _buildDataTransaksiTable(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _buildDataMasterTable(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('No.')),
        DataColumn(label: Text('Judul Inputan Data')),
        DataColumn(label: Text('Aksi')),
      ],
      rows: [
        DataRow(cells: [
          const DataCell(Text('1')),
          const DataCell(Text('Laporan Jenis Layanan')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Laporan Jenis Layanan')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Laporan Jenis Layanan')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Laporan Jenis Layanan')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Laporan Jenis Layanan')),
            ],
          )),
        ]),
        DataRow(cells: [
          const DataCell(Text('2')),
          const DataCell(Text('Laporan Kategori Layanan')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Laporan Kategori Layanan')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Laporan Kategori Layanan')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Laporan Kategori Layanan')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Laporan Kategori Layanan')),
            ],
          )),
        ]),
        DataRow(cells: [
          const DataCell(Text('3')),
          const DataCell(Text('Laporan Pelanggan')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Laporan Pelanggan')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Laporan Pelanggan')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Laporan Pelanggan')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Laporan Pelanggan')),
            ],
          )),
        ]),
        DataRow(cells: [
          const DataCell(Text('4')),
          const DataCell(Text('Laporan Proyek')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Laporan Proyek')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Laporan Proyek')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Laporan Proyek')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Laporan Proyek')),
            ],
          )),
        ]),
      ],
    );
  }

  Widget _buildDataTransaksiTable(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('No.')),
        DataColumn(label: Text('Judul Inputan Data')),
        DataColumn(label: Text('Aksi')),
      ],
      rows: [
        DataRow(cells: [
          const DataCell(Text('1')),
          const DataCell(Text('Transaksi Pengujian')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Transaksi Pengujian')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Transaksi Pengujian')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Transaksi Pengujian')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Transaksi Pengujian')),
            ],
          )),
        ]),
        DataRow(cells: [
          const DataCell(Text('2')),
          const DataCell(Text('Transaksi Hasil Pengujian')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Transaksi Hasil Pengujian')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Transaksi Hasil Pengujian')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Transaksi Hasil Pengujian')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Transaksi Hasil Pengujian')),
            ],
          )),
        ]),
        DataRow(cells: [
          const DataCell(Text('3')),
          const DataCell(Text('Kuitansi')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Kuitansi')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Kuitansi')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Kuitansi')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Kuitansi')),
            ],
          )),
        ]),
        DataRow(cells: [
          const DataCell(Text('4')),
          const DataCell(Text('Tanda Terima Hasil Test')),
          DataCell(Row(
            children: [
              _buildActionButton(context, 'Edit', () => _editData(context, 'Tanda Terima Hasil Test')),
              _buildActionButton(context, 'Hapus', () => _deleteData(context, 'Tanda Terima Hasil Test')),
              _buildActionButton(context, 'Cetak', () => _printData(context, 'Tanda Terima Hasil Test')),
              _buildActionButton(context, 'Tambah', () => _addData(context, 'Tanda Terima Hasil Test')),
            ],
          )),
        ]),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  void _editData(BuildContext context, String data) {
    // Implement edit data logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit $data')),
    );
  }

  void _deleteData(BuildContext context, String data) {
    // Implement delete data logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Delete $data')),
    );
  }

  void _printData(BuildContext context, String data) {
    // Implement print data logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Print $data')),
    );
  }

  void _addData(BuildContext context, String data) {
    // Implement add data logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Add $data')),
    );
  }
}
