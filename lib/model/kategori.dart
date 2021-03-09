part of 'model.dart';

class Kategori implements Model {
  @override
  String id;

  String nama;
  String subNama;
  int modal;

  String kategori;
  String jenis;
  String deskripsi;
  String tanggalListing;
  String tanggalUpdate;

  String gambar;
  String gamThumb;

  String idUser;

  Kategori({
    this.id, 
    this.nama, 
    this.subNama, 
    this.modal,
    this.kategori,
    this.jenis,
    this.deskripsi,
    this.tanggalListing,
    this.tanggalUpdate,
    this.gambar,
    this.gamThumb,
    this.idUser
  });

  @override
    String toString() => '$nama, $subNama';
  
  // factory Kategori.fromJson(Map json) => Kategori(
  //   id: json['ID'] as String,
  //   nama: json['NAMA'] as String, 
  //   modal: json['HARGA'] != '' ? int.parse(json['HARGA'] as String) : 0,
  //   tanggalListing: json['TANGGAL'] as String, 
  //   tanggalUpdate: json['TANGGAL'] as String, 
  //   jenis: json['JENIS'] as String, 
  //   deskripsi: json['DESKRIPSI'] as String, 
  //   kategori: json['KATEGORI'] as String, 
  //   gambar: json['GAMBAR'] as String,
  //   gamThumb: json['GAMTHUM'] as String,
  // );
}

// "id_ide": "1",
// "nama_ide": "nama ide 8",
// "sub_nama_ide": "sub ide 8",
// "modal_ide": "1000",
// "kategori_ide": "",
// "jenis_ide": "jenis ide",
// "deskripsi_ide": "",
// "tanggal_listing_ide": "1970-01-01",
// "tanggal_update_ide": "1970-01-01",
// "gambar_ide": "https://i.stack.imgur.com/y9DpT.jpg",
// "gambar_thumb_ide": "",
// "id_user_upload_ide": "1"

// "id_pelatihan_usaha": "1",
// "nama_pelatihan_usaha": "nama pelatihan 1000",
// "sub_nama_pelatihan_usaha": "sub nama pelatihan 1000",
// "modal_pelatihan_usaha": "2000000",
// "biaya_pelatihan_usaha": "200000",
// "kategori_pelatihan_usaha": "jasa",
// "tag_pelatihan_usaha": "kursus",
// "jenis_pelatihan_usaha": "jenis pelatihan",
// "deskripsi_pelatihan_usaha": "",
// "tanggal_listing_pelatihan_usaha": "1970-01-01",
// "tanggal_update_pelatihan_usaha": "1970-01-01",
// "pengajar_pelatihan_usaha": "PEngajar pelatihan",
// "no_konsultasi_pelatihan_usaha": "0989284",
// "gambar_pelatihan_usaha": "https://i.stack.imgur.com/y9DpT.jpg",
// "gambar_pelatihan_usaha_thumb": "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png",
// "id_user_upload_pelatihan_usaha": "1"