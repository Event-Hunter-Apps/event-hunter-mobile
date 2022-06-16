class Kategori {
  late final int id;
  late final String nama;
  Null createdAt;
  Null updatedAt;
  Null deletedAt;

  Kategori({
    required this.id,
    required this.nama,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
