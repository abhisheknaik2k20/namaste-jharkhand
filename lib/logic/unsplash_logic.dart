import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/unsplash_photo_data.dart';
import 'package:namste_jharkhand/logic/unsplash_service.dart';

class UnsplashLogic {
  final Map<String, List<String>> _idsByCollection = UnsplashPhotoData.photosByCollectionId;
  UnsplashService get service => GetIt.I.get<UnsplashService>();
  List<String>? getCollectionPhotos(String collectionId) => _idsByCollection[collectionId];
}
