import 'dart:collection';

import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/artifact_api_service.dart';
import 'package:namste_jharkhand/logic/common/http_client.dart';
import 'package:namste_jharkhand/logic/data/artifact_data.dart';

class ArtifactAPILogic {
  final HashMap<String, ArtifactData?> _artifactCache = HashMap();
  ArtifactAPIService get service => GetIt.I.get<ArtifactAPIService>();
  Future<ArtifactData?> getArtifactByID(String id, {bool selfHosted = false}) async {
    if (_artifactCache.containsKey(id)) return _artifactCache[id];
    ServiceResult<ArtifactData?> result =
        (await (selfHosted ? service.getSelfHostedObjectByID(id) : service.getMetObjectByID(id)));
    if (!result.success) throw $strings.artifactDetailsErrorNotFound(id);
    ArtifactData? artifact = result.content;
    return _artifactCache[id] = artifact;
  }
}
