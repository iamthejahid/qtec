import 'dart:developer';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class GlobalFunctions {
  static String warning =
      "[🚫][Provider] : Debug print is encoded, please follow the code of conduct. [🚫] ";

  static bool isPrint = true;

  // For printing stuff.
  static void customPrntr(dynamic object) {
    if (isPrint) {
      log("[🌶️] : " + object.toString());
    } else {
      print(warning);
    }
  }

  // For printing white stuff.
  static void customPrntrWhite(dynamic object) {
    if (isPrint) {
      log('\x1b[37m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  // For printing yellow stuff.
  static void customPrntrYellow(dynamic object) {
    if (isPrint) {
      log('\x1b[93m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  // For printing green stuff.
  static void customPrntrGreen(dynamic object) {
    if (isPrint) {
      log('\x1b[32m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  static void attention(dynamic object) {
    if (isPrint) {
      log(
        '\x1b[47m' +
            '\x1b[36m' +
            '            [Attention] : $object            ' +
            '\x1b[0m',
      );
    } else {
      print(warning);
    }
  }

  static void errorPrint(dynamic object) {
    log("", error: '\x1b[41m' + '\x1b[47m' + ' [Error] : $object ' + '\x1b[0m');
  }

  Future<File?> imageCompressor(File file, String str) async {
    int _quality;
    final bytes = (await file.readAsBytes()).lengthInBytes;
    final imageSizeInMb = bytes / 1048576;

    if (imageSizeInMb > 5) {
      _quality = 25;
    } else if (imageSizeInMb > 3) {
      _quality = 40;
    } else {
      _quality = 50;
    }

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      str,
      quality: _quality,
    );
    File resultFile = File(result!.path);
    return resultFile;
  }

  Future<double> imageSizeInMB(File file) async {
    final bytes = (await file.readAsBytes()).lengthInBytes;
    final imageSizeInMb = bytes / 1048576;
    return imageSizeInMb;
  }
}
