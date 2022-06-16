import 'package:event_hunter/models/event_model.dart';

import 'kategori_model.dart';

class TicketModel {
  late final String message;
  late final EventModel? event;
  late final List<Tikets> tikets;

  TicketModel({
    required this.message,
    required this.event,
    required this.tikets,
  });

  TicketModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    event = EventModel.fromJson(json['event']);
    if (json['tikets'] != null) {
      tikets = <Tikets>[];
      json['tikets'].forEach((v) {
        tikets.add(Tikets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (event != null) {
      data['event'] = event?.toJson();
    }
    if (tikets != null) {
      data['tikets'] = tikets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tikets {
  late final int id;
  late final int eventId;
  late final int kategoriId;
  late final String nama;
  late final String deskripsi;
  late final int harga;
  Null createdAt;
  Null updatedAt;
  Null deletedAt;
  Kategori? kategori;

  Tikets({
    required this.id,
    required this.eventId,
    required this.kategoriId,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.kategori,
  });

  Tikets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    kategoriId = json['kategori_id'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    harga = json['harga'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    kategori =
        json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['event_id'] = eventId;
    data['kategori_id'] = kategoriId;
    data['nama'] = nama;
    data['deskripsi'] = deskripsi;
    data['harga'] = harga;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (kategori != null) {
      data['kategori'] = kategori!.toJson();
    }
    return data;
  }
}
