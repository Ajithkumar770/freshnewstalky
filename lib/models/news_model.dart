class NewsModel {
  String? newsTitle;
  String? newsImage;
  int? views;
  int? downloads;
  int? likes;
  int? shares;
  int? totalamount;
  bool? isPremium;

  NewsModel(
      {this.downloads,
      this.likes,
      this.newsImage,
      this.newsTitle,
      this.shares,
      this.totalamount,
      this.isPremium,
      this.views});
}
