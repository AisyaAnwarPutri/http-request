import 'dart:convert';

import 'package:http_request/model/article_model.dart';
import 'package:http/http.dart';

//Sekarang mari kita buat layanan permintaan HTTP
// kelas ini akan memungkinkan kita untuk membuat permintaan get http sederhana
// dari API dan dapatkan Artikel lalu kembalikan daftar Artikel

class ApiService {
// mari tambahkan URL Endpoint, Anda dapat memeriksa dokumentasi situs web
  // dan pelajari tentang Titik Akhir yang berbeda
  //untuk contoh ini saya akan menggunakan satu titik akhir

  //CATATAN: pastikan untuk menggunakan apikey SENDIRI, Anda dapat membuat akun gratis dan
  // pilih opsi pengembang, GRATIS
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey={ADD YOUR API KEY HERE}";

//Sekarang mari kita buat fungsi permintaan http
  // tapi pertama-tama mari kita impor paket http

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

//pertama-tama mari kita periksa apakah kita mendapat kode status 200: ini berarti permintaannya berhasil
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

//baris ini akan memungkinkan kita untuk mendapatkan artikel yang berbeda dari file json dan memasukkannya ke dalam daftar
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
