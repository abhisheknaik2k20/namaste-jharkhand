class ArtifactData {
  ArtifactData({
    required this.objectId,
    required this.title,
    required this.image,
    required this.date,
    required this.period,
    required this.country,
    required this.medium,
    required this.dimension,
    required this.classification,
    required this.culture,
    required this.objectType,
    required this.objectBeginYear,
    required this.objectEndYear,
  });
  static const String baseSelfHostedImagePath = 'https://www.wonderous.info/met/';

  final String objectId;
  final String title;
  final String image;
  final int objectBeginYear;
  final int objectEndYear;
  final String objectType;
  final String date;
  final String period;
  final String country;
  final String medium;
  final String dimension;
  final String classification;
  final String culture;
  String get selfHostedImageUrl => getSelfHostedImageUrl(objectId);
  String get selfHostedImageUrlSmall => getSelfHostedImageUrlSmall(objectId);
  String get selfHostedImageUrlMedium => getSelfHostedImageUrlMedium(objectId);
  static String getSelfHostedImageUrl(String id) => '$baseSelfHostedImagePath$id.jpg';
  static String getSelfHostedImageUrlSmall(String id) => '$baseSelfHostedImagePath${id}_600.jpg';
  static String getSelfHostedImageUrlMedium(String id) => '$baseSelfHostedImagePath${id}_2000.jpg';
}
