import 'package:flutter/material.dart';

class InputDataTerimaHasilTestPage extends StatefulWidget {
  @override
  _InputDataTerimaHasilTestPageState createState() => _InputDataTerimaHasilTestPageState();
}

class _InputDataTerimaHasilTestPageState extends State<InputDataTerimaHasilTestPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _kodeTandaTerimaController = TextEditingController();
  final TextEditingController _kodeTransaksiController = TextEditingController();
  final TextEditingController _namaPelangganController = TextEditingController();
  final TextEditingController _namaProyekController = TextEditingController();
  final TextEditingController _namaPenerimaController = TextEditingController();
  final TextEditingController _namaPenyerahDokumenController = TextEditingController();

  DateTime? _tanggalDiterimaDokumen;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil disimpan')),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Terima Hasil Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField(controller: _kodeTandaTerimaController, labelText: 'Kode Tanda Terima', icon: Icons.assignment),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _kodeTransaksiController, labelText: 'Kode Transaksi', icon: Icons.code),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _namaPelangganController, labelText: 'Nama Pelanggan', icon: Icons.person),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _namaProyekController, labelText: 'Nama Proyek', icon: Icons.work),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _namaPenerimaController, labelText: 'Nama Penerima', icon: Icons.person_pin),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _namaPenyerahDokumenController, labelText: 'Nama Penyerah Dokumen', icon: Icons.person_pin_circle),
              const SizedBox(height: 20),
              _buildDateFormField(
                context,
                labelText: 'Tanggal Diterima Dokumen',
                selectedDate: _tanggalDiterimaDokumen,
                onSelected: (newDate) {
                  setState(() {
                    _tanggalDiterimaDokumen = newDate;
                  });
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

  TextFormField _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }

  TextFormField _buildDateFormField(
    BuildContext context, {
    required String labelText,
    required DateTime? selectedDate,
    required Function(DateTime) onSelected,
  }) {
    return TextFormField(
      controller: TextEditingController(
        text: selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : '',
      ),
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null && picked != selectedDate) {
          onSelected(picked);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date for $labelText';
        }
        return null;
      },
    );
  }
}
