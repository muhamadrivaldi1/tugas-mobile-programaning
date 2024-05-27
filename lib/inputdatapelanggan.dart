import 'package:flutter/material.dart';

class InputDataPelangganPage extends StatefulWidget {
  @override
  _InputDataPelangganPageState createState() => _InputDataPelangganPageState();
}

class _InputDataPelangganPageState extends State<InputDataPelangganPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kodePelangganController = TextEditingController();
  final TextEditingController _namaPelangganController = TextEditingController();
  final TextEditingController _npwpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String kodePelanggan = _kodePelangganController.text;
      String namaPelanggan = _namaPelangganController.text;
      String npwp = _npwpController.text;
      String alamat = _alamatController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan:\nKode Pelanggan: $kodePelanggan\nNama Pelanggan: $namaPelanggan\nNPWP: $npwp\nAlamat: $alamat')),
      );

      _kodePelangganController.clear();
      _namaPelangganController.clear();
      _npwpController.clear();
      _alamatController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Pelanggan Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.person, size: 100, color: const Color.fromARGB(255, 175, 15, 127),),
              const SizedBox(height: 20),
              TextFormField(
                controller: _kodePelangganController,
                decoration: const InputDecoration(
                  labelText: 'Kode Pelanggan',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter kode pelanggan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _namaPelangganController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pelanggan',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter nama pelanggan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _npwpController,
                decoration: const InputDecoration(
                  labelText: 'NPWP',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.book),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter NPWP';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter alamat';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 175, 15, 127),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Simpan', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
