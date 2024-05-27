import 'package:flutter/material.dart';

class InputDataKuitansiPage extends StatefulWidget {
  @override
  _InputDataKuitansiPageState createState() => _InputDataKuitansiPageState();
}

class _InputDataKuitansiPageState extends State<InputDataKuitansiPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _noKuitansiController = TextEditingController();
  final TextEditingController _kodeTransaksiController = TextEditingController();
  final TextEditingController _namaPelangganController = TextEditingController();
  final TextEditingController _totalBiayaController = TextEditingController();
  final TextEditingController _untukPembayaranController = TextEditingController();
  final TextEditingController _jumlahBayarController = TextEditingController();
  final TextEditingController _terbilangJumlahBayarController = TextEditingController();

  DateTime? _tanggalPembayaran;
  String? _selectedCaraBayar;

  final List<String> _caraBayarList = ['Cash', 'Credit'];

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
        title: const Text('Input Data Kuitansi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField(controller: _noKuitansiController, labelText: 'No. Kuitansi', icon: Icons.receipt),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _kodeTransaksiController, labelText: 'Kode Transaksi', icon: Icons.code),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _namaPelangganController, labelText: 'Nama Pelanggan', icon: Icons.person),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _totalBiayaController, labelText: 'Total Biaya', icon: Icons.attach_money),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _untukPembayaranController, labelText: 'Untuk Pembayaran', icon: Icons.money),
              const SizedBox(height: 20),
              _buildDropdownFormField(
                value: _selectedCaraBayar,
                labelText: 'Cara Bayar',
                icon: Icons.payment,
                items: _caraBayarList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCaraBayar = newValue as String?;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _jumlahBayarController, labelText: 'Jumlah Bayar', icon: Icons.monetization_on),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _terbilangJumlahBayarController, labelText: 'Terbilang (Jumlah Bayar)', icon: Icons.format_list_numbered),
              const SizedBox(height: 20),
              _buildDateFormField(
                context,
                labelText: 'Tanggal Pembayaran',
                selectedDate: _tanggalPembayaran,
                onSelected: (newDate) {
                  setState(() {
                    _tanggalPembayaran = newDate;
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

  DropdownButtonFormField<String> _buildDropdownFormField({
    required String? value,
    required String labelText,
    required IconData icon,
    required List<DropdownMenuItem<String>> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
      items: items,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a $labelText';
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
        text: selectedDate != null
            ? "${selectedDate.toLocal()}".split(' ')[0]
            : '',
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
