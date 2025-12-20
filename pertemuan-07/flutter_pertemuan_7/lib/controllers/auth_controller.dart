import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import '../models/app_user.dart';

class AuthController extends ChangeNotifier {
  final List<AppUser> _users = [];
  AppUser? currentUser;

  // Tambahan untuk main.dart agar bisa memuat user yang tersimpan di LocalStorage
  void loadUserFromLocal(String email) {
    currentUser = findByEmail(email);
    // Tidak perlu notifyListeners karena langsung diakses dari RootApp sebelum ada widget yang listening
  }

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
    // Tidak perlu notifyListeners di register
    return true;
  }

  bool login({required String email, required String password}) {
    final e = email.toLowerCase();
    try {
      final user = _users.firstWhere(
        (u) => u.email.toLowerCase() == e && u.password == password,
      );
      currentUser = user;
      notifyListeners(); // Notifikasi perubahan setelah login
      return true;
    } catch (_) {
      return false;
    }
  }

  void logout() {
    currentUser = null;
    notifyListeners(); // Notifikasi perubahan setelah logout
  }

  AppUser? findByEmail(String email) {
    final e = email.toLowerCase();
    return _users.firstWhereOrNull((u) => u.email.toLowerCase() == e);
  }
}