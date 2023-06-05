class Wisata {
    int nik;
    String nama;
    String alamat;
    String telp;
    String foto;
    int idKelompokWisata;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    Wisata({
        required this.nik,
        required this.nama,
        required this.alamat,
        required this.telp,
        required this.foto,
        required this.idKelompokWisata,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        nik: json["nik"],
        nama: json["nama"],
        alamat: json["alamat"],
        telp: json["telp"],
        foto: json["foto"],
        idKelompokWisata: json["id_kelompok_wisata"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "nik": nik,
        "nama": nama,
        "alamat": alamat,
        "telp": telp,
        "foto": foto,
        "id_kelompok_wisata": idKelompokWisata,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

