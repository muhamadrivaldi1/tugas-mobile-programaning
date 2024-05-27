import 'package:flutter/material.dart';

class InputDataJenisPage extends StatefulWidget {
  @override
  _InputDataJenisPageState createState() => _InputDataJenisPageState();
}

class _InputDataJenisPageState extends State<InputDataJenisPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kodeLayananController = TextEditingController();
  final TextEditingController _namaLayananController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String kodeLayanan = _kodeLayananController.text;
      String namaLayanan = _namaLayananController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan:\nKode Layanan: $kodeLayanan\nNama Layanan: $namaLayanan')),
      );

      _kodeLayananController.clear();
      _namaLayananController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Jenis Page'),
        backgroundColor: const Color.fromARGB(255, 175, 15, 127),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.add_business, size: 100, color: const Color.fromARGB(255, 175, 15, 127),),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _kodeLayananController,
                    decoration: const InputDecoration(
                      labelText: 'Kode Layanan',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.code),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter kode layanan';
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
        ),
      ),
    );
  }
}
