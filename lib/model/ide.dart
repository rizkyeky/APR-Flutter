part of 'model.dart';

class Ide extends Kategori {
  
  Ide({
    String id, 
    String nama, 
    String subNama, 
    int modal,
    String kategori,
    String jenis,
    String deskripsi,
    String tanggalListing,
    String tanggalUpdate,
    String gambar,
    String gamThumb,
    String idUser,
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
    idUser: idUser,
  );

  factory Ide.fromJson(Map json) => Ide(
    id: json['id_ide'] as String,
    nama: json['nama_ide'] as String, 
    subNama: json['sub_nama_ide'] as String, 
    modal: json['modal_ide'] != '' ? int.parse(json['modal_ide'] as String) : 0,
    tanggalListing: json['tanggal_listing_ide'] as String, 
    tanggalUpdate: json['tanggal_update_ide'] as String, 
    jenis: json['jenis_ide'] as String, 
    deskripsi: json['deskripsi_ide'] as String, 
    kategori: json['kategori_ide'] as String, 
    gambar: json['gambar_ide'] as String,
    gamThumb: json['gambar_ide_thumb'] as String,
    idUser: json['id_user_upload_ide'] as String,
  );
}