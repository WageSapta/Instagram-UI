// ignore_for_file: constant_identifier_names

enum SourceType {
  VIDEO,
  PHOTO,
}

class TagModel {
  final String id;
  final int idSource;
  final SourceType type;
  TagModel({
    required this.id,
    required this.idSource,
    required this.type,
  });
}
