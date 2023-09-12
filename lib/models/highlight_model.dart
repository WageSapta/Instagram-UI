class HighlightModel {
  final List<HighlightImageModel> images;
  final String name;

  HighlightModel({
    required this.images,
    required this.name,
  });
}

class HighlightImageModel {
  final String image;
  final DateTime date;
  HighlightImageModel({
    required this.image,
    required this.date,
  });
}
