import 'package:flutter/material.dart';

class InputDataKategoriLayananPage extends StatefulWidget {
  @override
  _InputDataKategoriLayananPageState createState() => _InputDataKategoriLayananPageState();
}

class _InputDataKategoriLayananPageState extends State<InputDataKategoriLayananPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kodeKategoriController = TextEditingController();
  final TextEditingController _namaLayananController = TextEditingController();
  final TextEditingController _referensiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String kodeKategori = _kodeKategoriController.text;
      String namaLayanan = _namaLayananController.text;
      String referensi = _referensiController.text;
      String ukuran = _beratController.text;
      String harga = _hargaController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan:\nKode Kategori: $kodeKategori\nNama Layanan: $namaLayanan\nReferensi: $referensi\nBerat: $ukuran\nHarga: $harga')),
      );

      _kodeKategoriController.clear();
      _namaLayananController.clear();
      _referensiController.clear();
      _beratController.clear();
      _hargaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Kategori Layanan Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.category, size: 100, color: const Color.fromARGB(255, 175, 15, 127),),
              const SizedBox(height: 20),
              TextFormField(
                controller: _kodeKategoriController,
                decoration: const InputDecoration(
                  labelText: 'Kode Kategori Layanan',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter kode kategori layanan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _namaLayananController,
                decoration: const InputDecoration(
                  labelText: 'Nama Layanan',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.label),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter nama layanan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _referensiController,
                decoration: const InputDecoration(
                  labelText: 'Referensi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.book),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter referensi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _beratController,
                decoration: const InputDecoration(
                  labelText: 'Berat',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.straighten),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Berat';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter harga';
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
