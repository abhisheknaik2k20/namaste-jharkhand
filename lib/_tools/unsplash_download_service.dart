import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show get;
import 'package:path_provider/path_provider.dart';
import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/unsplash_service.dart';
import 'package:namste_jharkhand/logic/wonders_logic.dart';

class UnsplashDownloadService {
  static final UnsplashService _unsplash = UnsplashService();
  static final WondersLogic _wondersLogic = WondersLogic();

  /// Downloads one image in various sizes
  static Future<int> downloadImageSet(String id) async {
    final photo = await _unsplash.loadInfo(id);
    int saveCount = 0;
    if (photo != null) {
      final rootDir = await getApplicationDocumentsDirectory();
      final imagesDir = '${rootDir.path}/unsplash_images';
      await Directory(imagesDir).create(recursive: true);
      debugPrint('Downloading image set $id to $imagesDir');
      final sizes = [32, 400, 800, 2000, 1600, 4000];
      for (var size in sizes) {
        final url = photo.getUnsplashUrl(size);
        final imgResponse = await get(Uri.parse(url));
        File file = File('$imagesDir/$id-$size.jpg');
        file.writeAsBytesSync(imgResponse.bodyBytes);
        //print('file saved @ ${file.path}');
        saveCount++;
      }
    }
    return saveCount;
  }

  /// Downloads all images for a single collection, in various sizes
  static Future<void> downloadCollectionImages(WonderData data) async {
    final collection = await _unsplash.loadCollectionPhotos(data.unsplashCollectionId) ?? [];
    debugPrint('download: ${collection.length} images for ${data.title}');
    int downloadCount = 0;
    for (var p in collection) {
      downloadCount += await downloadImageSet(p);
    }
    debugPrint('${data.title} complete, downloads = $downloadCount');
  }

  static Future<void> downloadAllCollections() async {
    for (var w in _wondersLogic.all) {
      await downloadCollectionImages(w);
    }
  }

  static Future<void> printPhotosByCollectionIdMap() async {
    Map<String, List<String>> imageListByCollectionId = {};
    for (var w in _wondersLogic.all) {
      final collection = await _unsplash.loadCollectionPhotos(w.unsplashCollectionId) ?? [];
      imageListByCollectionId[w.unsplashCollectionId] = collection;
    }
    debugPrint('''
    final photosByCollectionId = ${jsonEncode(imageListByCollectionId).replaceAll('"', '\'')};
    ''');
  }
}
