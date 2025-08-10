class CoverModel {
  final String imageUrl;
  final String title;

  CoverModel({required this.imageUrl, required this.title});

  static List<CoverModel> getCovers() {
    return [
      CoverModel(
        imageUrl: 'assets/cover/cover2.png',
        title: 'Black collection',
      ),
      CoverModel(imageUrl: 'assets/cover/cover1.png', title: 'HAE BY HAEKIM'),
      CoverModel(
        imageUrl: 'assets/cover/cover3.png',
        title: 'Special Collection',
      ),
    ];
  }
}
