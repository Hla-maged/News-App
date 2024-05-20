class ArticleModel {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? url;
  ArticleModel({required this.image,required this.url, required this.title, required this.subtitle});
 
 factory ArticleModel.fromjson(json){
  return ArticleModel (
            image: json['urlToImage'],
            title: json['title'],
            subtitle: json['description'],
            url: json['url']);
 }
}
