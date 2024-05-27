import 'package:flutter/material.dart';

class InputDataHasilUjiPage extends StatefulWidget {
  @override
  _InputDataHasilUjiPageState createState() => _InputDataHasilUjiPageState();
}

class _InputDataHasilUjiPageState extends State<InputDataHasilUjiPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _kodeHasilUjiController = TextEditingController();
  final TextEditingController _kodeTransaksiController = TextEditingController();
  final TextEditingController _namaPelangganController = TextEditingController();
  final TextEditingController _jenisBendaController = TextEditingController();
  final TextEditingController _kondisiBendaController = TextEditingController();
  final TextEditingController _materialCapingController = TextEditingController();
  final TextEditingController _kodeSampleController = TextEditingController();
  final TextEditingController _mutuController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  final TextEditingController _bebanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  DateTime? _tanggalDiterima;
  DateTime? _tanggalCor;
  DateTime? _tanggalUji;

  String? _selectedNamaProjek;
  String? _selectedTester;
  String? _selectedVerifier;
  final List<String> _namaProjekList = ['Tambang emas', 'Tambang besi', 'Tambang batu bara', 'Tamabang timah'];
  final List<String> _pengujiList = ['Dafa', 'Yudis', 'Nauval', 'Hilmi', 'Rivaldi','Bagas'];

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
        title: const Text('Input Data Hasil Uji Kuat Tekan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField(controller: _kodeHasilUjiController, labelText: 'Kode Hasil Uji', icon: Icons.code),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _kodeTransaksiController, labelText: 'Kode Transaksi Layanan', icon: Icons.code),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _namaPelangganController, labelText: 'Nama Pelanggan', icon: Icons.person),
              const SizedBox(height: 20),
              _buildDropdownFormField(
                value: _selectedNamaProjek,
                labelText: 'Nama Projek',
                icon: Icons.work,
                items: _namaProjekList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedNamaProjek = newValue as String?;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _jenisBendaController, labelText: 'Jenis Benda Uji', icon: Icons.category),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _kondisiBendaController, labelText: 'Kondisi Benda Uji', icon: Icons.check_box),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _materialCapingController, labelText: 'Material Caping', icon: Icons.layers),
              const SizedBox(height: 20),
              _buildDateFormField(
                context,
                labelText: 'Diterima Tanggal',
                selectedDate: _tanggalDiterima,
                onSelected: (newDate) {
                  setState(() {
                    _tanggalDiterima = newDate;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildDropdownFormField(
                value: _selectedTester,
                labelText: 'Tester',
                icon: Icons.person_outline,
                items: _pengujiList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTester = newValue as String?;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildDropdownFormField(
                value: _selectedVerifier,
                labelText: 'Verifier',
                icon: Icons.verified,
                items: _pengujiList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedVerifier = newValue as String?;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _kodeSampleController, labelText: 'Kode Sample', icon: Icons.tag),
              const SizedBox(height: 20),
              _buildDateFormField(
                context,
                labelText: 'Tanggal Cor [Cast]',
                selectedDate: _tanggalCor,
                onSelected: (newDate) {
                  setState(() {
                    _tanggalCor = newDate;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildDateFormField(
                context,
                labelText: 'Tanggal Uji [Test]',
                selectedDate: _tanggalUji,
                onSelected: (newDate) {
                  setState(() {
                    _tanggalUji = newDate;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _mutuController, labelText: 'Mutu Grade', icon: Icons.grade),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _beratController, labelText: 'Berat [Weight]', icon: Icons.fitness_center),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _bebanController, labelText: 'Beban [Load]', icon: Icons.line_weight),
              const SizedBox(height: 20),
              _buildTextFormField(controller: _keteranganController, labelText: 'Keterangan', icon: Icons.note),
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
