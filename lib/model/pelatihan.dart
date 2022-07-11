part of 'model.dart';

class Pelatihan extends Kategori {

  int? biaya;
  String? tag;
  String? pengajar;
  String? noKonsul;
  
  Pelatihan({
    required String id, 
    String? nama, 
    String? subNama, 
    int? modal,
    String? kategori,
    String? jenis,
    String? deskripsi,
    String? tanggalListing,
    String? tanggalUpdate,
    String? gambar,
    String? gamThumb,
    String? idUser,
    this.biaya,
    this.tag,
    this.pengajar,
    this.noKonsul,
  }) : super(
    id: id, 
    nama: nama, 
    subNama: subNama, 
    modal: modal,
    kategori: kategori,
    jenis: jenis,
    deskripsi: deskripsi,
    tanggalListing: tanggalListing,
    tanggalUpdate: tanggalUpdate,
    gambar: gambar,
    gamThumb: gamThumb,
    idUser: idUser
  );

  factory Pelatihan.fromJson(Map json) => Pelatihan(
    id: json['id_pelatihan_usaha'] as String,
    nama: json['nama_pelatihan_usaha'] as String, 
    subNama: json['sub_nama_pelatihan_usaha'] as String, 
    modal: json['modal_pelatihan_usaha'] != '' ? int.parse(json['modal_pelatihan_usaha'] as String) : 0,
    biaya: json['biaya_pelatihan_usaha'] != '' ? int.parse(json['biaya_pelatihan_usaha'] as String) : 0,
    tanggalListing: json['tanggal_listing_pelatihan_usaha'] as String, 
    tanggalUpdate: json['tanggal_update_pelatihan_usaha'] as String, 
    jenis: json['jenis_pelatihan_usaha'] as String, 
    deskripsi: json['deskripsi_pelatihan_usaha'] as String, 
    kategori: json['kategori_pelatihan_usaha'] as String, 
    tag: json['tag_pelatihan_usaha'] as String,
    gambar: json['gambar_pelatihan_usaha'] as String,
    gamThumb: json['gambar_pelatihan_usaha_thumb'] as String,
    idUser: json['id_user_upload_pelatihan_usaha'] as String,
    pengajar: json['pengajar_pelatihan_usaha'] as String,
    noKonsul: json['no_konsultasi_pelatihan_usaha'] as String,
  );
}