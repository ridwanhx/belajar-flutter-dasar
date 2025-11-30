import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

// Implementasi Shared Preferences | REFACTORING
class LocalStorage {
  static const _keyLogin = "isLoggedIn";
  static const _keyEmail = "loggedEmail";

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<void> saveLogin(String email) async {
    final p = await _prefs;
    await p.setBool(_keyLogin, true);
    await p.setString(_keyEmail, email);
  }

  static Future<bool> isLoggedIn() async {
    final p = await _prefs;
    return p.getBool(_keyLogin) ?? false;
  }

  static Future<String?> getEmail() async {
    final p = await _prefs;
    return p.getString(_keyEmail);
  }

  static Future<void> clear() async {
    final p = await _prefs;
    await p.remove(_keyLogin);
    await p.remove(_keyEmail);
  }
}

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: LocalStorage.isLoggedIn(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final isLogged = snap.data!;
          return isLogged
              ? DashboardPage(authController: authController)
              : RegisterPage(authController: authController);
        },
      ),
    );
  }
}

// --------------------------------------
// 1. MODEL USER & CONTROLLER AUTENTIKASI
// --------------------------------------

// inisiasi model
class AppUser {
  final String fullName;
  final String email;
  final String password;
  final String nim;
  final String prodi;

  AppUser({
    required this.fullName,
    required this.email,
    required this.password,
    required this.nim,
    required this.prodi,
  });
}

// inisiasi controller
class AuthController {
  final List<AppUser> _users = [];
  AppUser? currentUser;

  bool register({
    required String fullName,
    required String email,
    required String password,
    required String nim,
    required String prodi,
  }) {
    final exists = _users.any(
      (u) => u.email.toLowerCase() == email.toLowerCase(),
    );
    if (exists) return false;

    _users.add(
      AppUser(
        fullName: fullName,
        email: email,
        password: password,
        nim: nim,
        prodi: prodi,
      ),
    );
    return true;
  }

  bool login({required String email, required String password}) {
    final e = email.toLowerCase();
    try {
      final user = _users.firstWhere(
        (u) => u.email.toLowerCase() == e && u.password == password,
      );
      currentUser = user;
      return true;
    } catch (_) {
      return false;
    }
  }

  void logout() => currentUser = null;

  AppUser? findByEmail(String email) {
    final e = email.toLowerCase();
    return _users.firstWhereOrNull((u) => u.email.toLowerCase() == e);
  }
}

// Singleton sederhana agar 1 instance AuthControlller dipakai di seluruh app
final AuthController authController = AuthController();

// --------------------------------------
// 2. MODEL JADWAL KULIAH + DATA DUMMY
// --------------------------------------

class JadwalKuliah {
  final String mataKuliah;
  final String hari;
  final String jam;
  final String ruang;
  final String dosen;

  JadwalKuliah({
    required this.mataKuliah,
    required this.hari,
    required this.jam,
    required this.ruang,
    required this.dosen,
  });
}

final List<JadwalKuliah> dummyJadwalKuliah = [
  JadwalKuliah(
    mataKuliah: 'Pemograman Mobile',
    hari: 'Senin',
    jam: '08.00 - 09.40',
    ruang: 'Lab RPL 1',
    dosen: 'Bpk. Andi, M.Kom.',
  ),
  JadwalKuliah(
    mataKuliah: 'Basis Data Lanjut',
    hari: 'Senin',
    jam: '10.00 - 11.40',
    ruang: 'Lab Basis Data',
    dosen: 'Ibu Sari, M.T.',
  ),
  JadwalKuliah(
    mataKuliah: 'Jaringan Komputer',
    hari: 'Selasa',
    jam: '13.00 - 14.40',
    ruang: 'Ruang Teori 3',
    dosen: 'Ibu Dina, M.Kom.',
  ),
  JadwalKuliah(
    mataKuliah: 'Kecerdasan Buatan',
    hari: 'Kamis',
    jam: '08.00 - 09.40',
    ruang: 'Lab AI',
    dosen: 'Bpk. Harry, Ph.D.',
  ),
  JadwalKuliah(
    mataKuliah: 'Manajemen Proyek 2',
    hari: 'Jumat',
    jam: '09.00 - 10.40',
    ruang: 'Ruang Teori 1',
    dosen: 'Ibu Maya, M.M.',
  ),
];

// --------------------------------------
// 3. ROOT WIDGET
// --------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth & Jadwal Kuliah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: RegisterPage(authController: authController),
    );
  }
}

// --------------------------------------
// 4. REGISTER PAGE
// --------------------------------------

class RegisterPage extends StatefulWidget {
  final AuthController authController;

  const RegisterPage({super.key, required this.authController});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirm = true;
  // prodi
  String? _selectedProdi;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final nim = _nimController.text.trim();
    final prodi = _selectedProdi!;

    final success = widget.authController.register(
      fullName: fullName,
      email: email,
      password: password,
      nim: nim,
      // menggunakan ! untuk memastikan bahwa _selectedProdi != null
      // dengan begini _selectedProdi aman untuk dipaksa menjadi non-null
      prodi: prodi,
    );

    if (success) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Registrasi Berhasil'),
            content: const Text(
              'Akun anda berhasil dibuat. Silahkan lanjut ke halaman login.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // tutup dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(authController: widget.authController),
                    ),
                  );
                },
                child: const Text('Ke halaman login.'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email sudah terdaftar. Gunakan email lain.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Registrasi akun baru',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Field Nama Lengkap tidak boleh kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    TextFormField(
                      controller: _nimController,
                      decoration: const InputDecoration(
                        labelText: 'NIM',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,

                      validator: (value) {
                        // field nim tidak boleh kosong
                        if (value == null || value.trim().isEmpty) {
                          return 'Field NIM tidak boleh kosong.';
                        }

                        // field nim hanya boleh berisi angka
                        if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
                          return 'NIM hanya boleh berisi angka';
                        }

                        if (value.trim().length < 8) {
                          return 'NIM minimal 8 digit.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Prodi',
                        border: OutlineInputBorder(),
                      ),
                      initialValue: _selectedProdi,
                      items: const [
                        DropdownMenuItem(
                          value: 'Informatika',
                          child: Text('Informatika'),
                        ),
                        DropdownMenuItem(
                          value: 'Sistem Informasi',
                          child: Text('Sistem Informasi'),
                        ),
                        DropdownMenuItem(
                          value: 'Manajemen Bisnis',
                          child: Text('Manajemen Bisnis'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedProdi = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field Prodi tidak boleh kosong.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Field Email tidak boleh kosong.';
                        }
                        if (!value.contains('@')) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscurePassword = !_isObscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Field Password tidak boleh kosong.';
                        }
                        if (value.trim().length < 6) {
                          return 'Password minimal 6 karakter.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _isObscureConfirm,
                      decoration: InputDecoration(
                        labelText: 'Konfirmasi Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscureConfirm = !_isObscureConfirm;
                            });
                          },
                          icon: Icon(
                            _isObscureConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Konfirmasi password tidak boleh kosong';
                        }
                        if (value.trim() != _passwordController.text.trim()) {
                          return 'Konfirmasi password tidak sama';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _handleRegister,
                        child: const Text('Daftar'),
                      ),
                    ),
                    SizedBox(height: 8),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              authController: widget.authController,
                            ),
                          ),
                        );
                      },
                      child: const Text('Sudah punya akun? Login di sini'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------
// 5. LOGIN PAGE
// --------------------------------------

class LoginPage extends StatefulWidget {
  final AuthController authController;

  const LoginPage({super.key, required this.authController});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Tampilkan loading dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    // Simulasi delay server
    // memberikan efek delay (seolah sedang memuat source / data)
    await Future.delayed(const Duration(seconds: 2));

    // cek login
    final success = widget.authController.login(
      email: email,
      password: password,
    );

    // tutup loading dialog
    Navigator.pop(context);

    if (success) {
      // simpan status login ke shared pref
      await LocalStorage.saveLogin(email);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DashboardPage(authController: widget.authController),
        ),
      );
    } else {
      // Login gagal, maka tampilkan snackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login gagal. Email / Password salah, atau anda belum register',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login Akun',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Field Email tidak boleh kosong';
                    }

                    if (!value.contains('@')) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscurePassword = !_isObscurePassword;
                        });
                      },
                      icon: Icon(
                        _isObscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Field Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 8),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RegisterPage(authController: widget.authController),
                      ),
                    );
                  },
                  child: const Text('Belum punya akun? Register di sini'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------
// 6. DASHBOARD PAGE - LIST JADWAL KULIAH
// --------------------------------------

class DashboardPage extends StatefulWidget {
  final AuthController authController;

  const DashboardPage({super.key, required this.authController});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late List<JadwalKuliah> _jadwalKuliahList;

  @override
  void initState() {
    super.initState();
    _jadwalKuliahList = List.from(dummyJadwalKuliah);
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final savedEmail = await LocalStorage.getEmail();
    if (savedEmail != null) {
      widget.authController.currentUser = widget.authController.findByEmail(
        savedEmail,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = widget.authController.currentUser?.fullName ?? "Mahasiswa";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Jadwal Kuliah"),
        actions: [
          IconButton(
            onPressed: () async {
              widget.authController.logout();
              await LocalStorage.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      LoginPage(authController: widget.authController),
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddJadwalDialog,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          _welcomeBanner(userName),
          Expanded(
            child: ListView.builder(
              itemCount: _jadwalKuliahList.length,
              itemBuilder: (_, i) {
                final j = _jadwalKuliahList[i];
                return _jadwalTile(j, i);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Dialog untuk tambah jadwal
  void _showAddJadwalDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Jadwal"),
          content: Text("Isi form tambah jadwal di sini"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                // Simpan data di sini
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  // Edit jadwal
  void _editJadwal(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Jadwal"),
          content: Text("Form edit jadwal untuk index $index"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                // Update data di sini
                Navigator.pop(context);
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  // Konfirmasi hapus jadwal
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Jadwal"),
          content: Text("Yakin ingin menghapus data?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Tidak"),
            ),
            ElevatedButton(
              onPressed: () {
                // Hapus data di sini
                setState(() {
                  // contoh: listJadwal.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
  }

  Widget _welcomeBanner(String name) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    color: Colors.blue.withOpacity(.1),
    child: Text(
      "Selamat datang, $name",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );

  Widget _jadwalTile(JadwalKuliah j, int i) => ListTile(
    title: Text(j.mataKuliah),
    subtitle: Text("${j.hari} • ${j.jam} • ${j.ruang}"),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _editJadwal(i),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _confirmDelete(i),
        ),
      ],
    ),
  );
}
