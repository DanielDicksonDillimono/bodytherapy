import 'dart:io';
//import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class PDFApi {
  static Future<File> loadAssetPDF(String filePath) async {
    final data = await rootBundle.load(filePath);
    final bytes = data.buffer.asInt8List();
    return await _storeFile(filePath, bytes);
  }

  static Future<File?> loadNetworkPDF(String url, String name) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/$name.pdf");
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: Duration(seconds: 0),
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      //  print(e.toString());
      return null;
    }

    //final response = await http.get(Uri.parse(url));
    //final bytes = response.bodyBytes;
    //return await _storeFile(url, bytes, name);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
