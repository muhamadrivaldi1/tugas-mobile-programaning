import 'package:flutter/material.dart';

class InputDataTransaksiPage extends StatefulWidget {
  @override
  _InputDataTransaksiPageState createState() => _InputDataTransaksiPageState();
}

class _InputDataTransaksiPageState extends State<InputDataTransaksiPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kodeTransaksiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  final TextEditingController _nilaiKategoriController = TextEditingController();
  
  String? _selectedProjek;
  String? _selectedPengirim;
  String? _selectedLayanan;
  String? _selectedKategoriLayanan;
  DateTime? _selectedTanggal;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String kodeTransaksi = _kodeTransaksiController.text;
      String berat = _beratController.text;
      String jumlah = _jumlahController.text;
      String catatan = _catatanController.text;
      String nilaiKategori = _nilaiKategoriController.text;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan:\nKode Transaksi: $kodeTransaksi\nBerart: $berat\nJumlah: $jumlah\nCatatan: $catatan\nNilai Kategori: $nilaiKategori')),
      );

      _kodeTransaksiController.clear();
      _beratController.clear();
      _jumlahController.clear();
      _catatanController.clear();
      _nilaiKategoriController.clear();
      setState(() {
        _selectedProjek = null;
        _selectedPengirim = null;
        _selectedLayanan = null;
        _selectedKategoriLayanan = null;
        _selectedTanggal = null;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedTanggal) {
      setState(() {
        _selectedTanggal = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INPUT DATA TRANSAKSI PENGUJIAN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.add_shopping_cart, size: 100, color: const Color.fromARGB(255, 175, 15, 127),),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _kodeTransaksiController,
                  decoration: const InputDecoration(
                    labelText: 'Kode Transaksi',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.code),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter kode transaksi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Nama Projek',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.business),
                  ),
                  items: ['Tambang emas', 'Tambang besi', 'Tambang timah', 'Tambang batu bara']
                      .map((projek) => DropdownMenuItem<String>(
                            value: projek,
                            child: Text(projek),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedProjek = value;
                    });
                  },
                  value: _selectedProjek,
                  validator: (value) => value == null ? 'Please select a projek' : null,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Nama Pengirim',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  items: ['Dafa', 'Rivaldi', 'Nauval', 'Bagas', 'Himli','Yudis']
                      .map((pengirim) => DropdownMenuItem<String>(
                            value: pengirim,
                            child: Text(pengirim),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPengirim = value;
                    });
                  },
                  value: _selectedPengirim,
                  validator: (value) => value == null ? 'Please select a pengirim' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () => _selectDate(context),
                  validator: (value) {
                    if (_selectedTanggal == null) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    text: _selectedTanggal == null
                        ? ''
                        : "${_selectedTanggal!.day}/${_selectedTanggal!.month}/${_selectedTanggal!.year}",
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Nama Layanan',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.local_shipping),
                  ),
                  items: ['pengiriman barang', 'perbaikan barang', 'ekspedisi antarnegara']
                      .map((layanan) => DropdownMenuItem<String>(
                            value: layanan,
                            child: Text(layanan),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedLayanan = value;
                    });
                  },
                  value: _selectedLayanan,
                  validator: (value) => value == null ? 'Please select a layanan' : null,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Nama Kategori Layanan',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: ['emas', 'besi', 'timah', 'batu bara']
                      .map((kategori) => DropdownMenuItem<String>(
                            value: kategori,
                            child: Text(kategori),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedKategoriLayanan = value;
                    });
                  },
                  value: _selectedKategoriLayanan,
                  validator: (value) => value == null ? 'Please select a kategori' : null,
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
                      return 'Please enter berat';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _jumlahController,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.confirmation_number),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter jumlah';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 175, 15, 127),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Tambah', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _catatanController,
                  decoration: const InputDecoration(
                    labelText: 'Kategori Catatan',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.note),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter kategori catatan';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nilaiKategoriController,
                  decoration: const InputDecoration(
                    labelText: 'Nilai Kategori',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.assessment),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter nilai kategori';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 175, 15, 127),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Tambah', style: TextStyle(fontSize: 18)),
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
    );
  }
}
