// ignore_for_file: non_constant_identifier_names

class EventModel {
  late final int? id;
  late final int? user_id;
  late final String? nama;
  late final String? deskripsi;
  late final String? tanggal_mulai;
  late final String? tanggal_berakhir;
  late final String? jam_buka;
  late final String? jam_tutup;
  late final String? lokasi;
  late final String? kota;
  late final int? harga;
  late final String? image;
  late final String? created_at;
  late final String? updated_at;
  late final String? deleted_at;

  EventModel({
    required this.id,
    required this.user_id,
    required this.nama,
    required this.deskripsi,
    required this.tanggal_mulai,
    required this.tanggal_berakhir,
    required this.jam_buka,
    required this.jam_tutup,
    required this.lokasi,
    required this.kota,
    required this.harga,
    required this.image,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'nama': nama,
      'deskripsi': deskripsi,
      'tanggal_mulai': tanggal_mulai,
      'tanggal_berakhir': tanggal_berakhir,
      'jam_buka': jam_buka,
      'jam_tutup': jam_tutup,
      'lokasi': lokasi,
      'kota': kota,
      'harga': harga,
      'image': image,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  EventModel.fromJson(Map json) {
    id = json['id'];
    user_id = json['user_id'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    tanggal_mulai = json['tanggal_mulai'];
    tanggal_berakhir = json['tanggal_berakhir'];
    jam_buka = json['jam_buka'];
    jam_tutup = json['jam_tutup'];
    lokasi = json['lokasi'];
    kota = json['kota'];
    harga = json['harga'];
    image = json['image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  EventModel.fromDynamic(dynamic json) {
    id = json.id;
    user_id = json.user_id;
    nama = json.nama;
    deskripsi = json.deskripsi;
    tanggal_mulai = json.tanggal_mulai;
    tanggal_berakhir = json.tanggal_berakhir;
    jam_buka = json.jam_buka;
    jam_tutup = json.jam_tutup;
    lokasi = json.lokasi;
    kota = json.kota;
    harga = json.harga;
    image = json.image;
    created_at = json.created_at;
    updated_at = json.updated_at;
    deleted_at = json.deleted_at;
  }
}
