import 'package:flutter_bloc_test/image_search/domain/entities/image_entity.dart';

abstract class ImageDataSource {
  Future<List<ImageEntity>> getSearchedImages(String apiKey, String query);
}
