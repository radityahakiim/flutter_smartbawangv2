class User {
  final int? id;
  final String namaLengkap;
  final String role;
  final String namaBisnis;
  final String alamatBisnis;
  final String provinsi;
  final String kota;
  final String email;
  final String nomorHp;
  final String password;

  User({
    this.id,
    required this.namaLengkap,
    required this.role,
    required this.namaBisnis,
    required this.alamatBisnis,
    required this.provinsi,
    required this.kota,
    required this.email,
    required this.nomorHp,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaLengkap': namaLengkap,
      'role': role,
      'namaBisnis': namaBisnis,
      'alamatBisnis': alamatBisnis,
      'provinsi': provinsi,
      'kota': kota,
      'email': email,
      'nomorHp': nomorHp,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        namaLengkap: map['namaLengkap'],
        role: map['role'],
        namaBisnis: map['namaBisnis'],
        alamatBisnis: map['alamatBisnis'],
        provinsi: map['provinsi'],
        kota: map['kota'],
        email: map['email'],
        nomorHp: map['nomorHp'],
        password: map['password']);
  }
}
