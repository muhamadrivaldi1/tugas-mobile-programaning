import 'package:flutter/material.dart';

class InputDataProjekPage extends StatefulWidget {
  @override
  _InputDataProjekPageState createState() => _InputDataProjekPageState();
}

class _InputDataProjekPageState extends State<InputDataProjekPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kodeProjekController = TextEditingController();
  final TextEditingController _namaProjekController = TextEditingController();
  final TextEditingController _telpFaxController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String kodeProjek = _kodeProjekController.text;
      String namaProjek = _namaProjekController.text;
      String telpFax = _telpFaxController.text;
      String email = _emailController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan:\nKode Proyek: $kodeProjek\nNama Proyek: $namaProjek\nTelp/Fax: $telpFax\nEmail: $email')),
      );

      _kodeProjekController.clear();
      _namaProjekController.clear();
      _telpFaxController.clear();
      _emailController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Proyek Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.work, size: 100, color: const Color.fromARGB(255, 175, 15, 127),),
              const SizedBox(height: 20),
              TextFormField(
                controller: _kodeProjekController,
                decoration: const InputDecoration(
                  labelText: 'Kode Proyek',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter kode proyek';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _namaProjekController,
                decoration: const InputDecoration(
                  labelText: 'Nama Proyek',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.label),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter nama proyek';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _telpFaxController,
                decoration: const InputDecoration(
                  labelText: 'Telp/Fax',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter telp/fax';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
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
