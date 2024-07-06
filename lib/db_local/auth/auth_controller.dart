import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_service.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';

class AuthController with ChangeNotifier {
  final AuthService authService = AuthService();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController namaBisnisController = TextEditingController();
  TextEditingController alamatBisnisController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomorHpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController loginEmailPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  String? _selectedRole;
  String? _selectedProvince;
  String? _selectedCity;

  String? get selectedRole => _selectedRole;
  String? get selectedProvince => _selectedProvince;
  String? get selectedCity => _selectedCity;

// City Section
  void setSelectedCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }

  bool isCitySelected() {
    return _selectedCity != null && _selectedCity!.isNotEmpty;
  }

// Province Section
  void setSelectedProvince(String? province) {
    _selectedProvince = province;
    notifyListeners();
  }

  bool isProvinceSelected() {
    return _selectedProvince != null && _selectedProvince!.isNotEmpty;
  }

// Role section
  void setSelectedRole(String? role) {
    _selectedRole = role;
    notifyListeners();
  }

  bool isRoleSelected() {
    return _selectedRole != null && _selectedRole!.isNotEmpty;
  }

  // Auth section

  Future<User?> register(BuildContext context,
      GlobalKey<ScaffoldMessengerState> scaffoldKey) async {
    User user = User(
        namaLengkap: namaLengkapController.text,
        role: _selectedRole!,
        namaBisnis: namaBisnisController.text,
        alamatBisnis: alamatBisnisController.text,
        provinsi: _selectedProvince!,
        kota: _selectedCity!,
        email: emailController.text,
        nomorHp: nomorHpController.text,
        password: passwordController.text);

    bool success = await authService.register(user);
    if (!success) {
      scaffoldKey.currentState?.showSnackBar(
        const SnackBar(
            content: Text("Email dan nomor telepon sudah terpakai!")),
      );
      return null;
    } else {
      notifyListeners();
      return user;
    }
  }

  Future<User?> login() async {
    return await authService.login(
        loginEmailPhoneController.text, loginPasswordController.text);
  }

  // void logout() {
  //   loginEmailPhoneController.clear();
  //   loginPasswordController.clear();
  // }

  void disposeControllers() {
    namaLengkapController.dispose();
    namaBisnisController.dispose();
    alamatBisnisController.dispose();
    emailController.dispose();
    nomorHpController.dispose();
    passwordController.dispose();
    loginEmailPhoneController.dispose();
    loginPasswordController.dispose();
  }
}
