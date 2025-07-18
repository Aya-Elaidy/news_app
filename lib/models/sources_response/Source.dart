/// id : "buzzfeed"
/// name : "Buzzfeed"
/// description : "BuzzFeed is a cross-platform, global network for news and entertainment that generates seven billion views each month."
/// url : "https://www.buzzfeed.com"
/// category : "entertainment"
/// language : "en"
/// country : "us"

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;
  Source({
      this.id, 
      this.name, 
      this.description, 
      this.url, 
      this.category, 
      this.language, 
      this.country,});

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }


  Map<String, dynamic> toJson()
  {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['url'] = url;
    map['category'] = category;
    map['language'] = language;
    map['country'] = country;
    return map;
  }

}