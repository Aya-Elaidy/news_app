import 'Source.dart';

/// status : "ok"
/// sources : [{"id":"buzzfeed","name":"Buzzfeed","description":"BuzzFeed is a cross-platform, global network for news and entertainment that generates seven billion views each month.","url":"https://www.buzzfeed.com","category":"entertainment","language":"en","country":"us"},{"id":"entertainment-weekly","name":"Entertainment Weekly","description":"Online version of the print magazine includes entertainment news, interviews, reviews of music, film, TV and books, and a special area for magazine subscribers.","url":"http://www.ew.com","category":"entertainment","language":"en","country":"us"},{"id":"ign","name":"IGN","description":"IGN is your site for Xbox One, PS4, PC, Wii-U, Xbox 360, PS3, Wii, 3DS, PS Vita and iPhone games with expert reviews, news, previews, trailers, cheat codes, wiki guides and walkthroughs.","url":"http://www.ign.com","category":"entertainment","language":"en","country":"us"},{"id":"mashable","name":"Mashable","description":"Mashable is a global, multi-platform media and entertainment company.","url":"https://mashable.com","category":"entertainment","language":"en","country":"us"},{"id":"mtv-news","name":"MTV News","description":"The ultimate news source for music, celebrity, entertainment, movies, and current events on the web. It's pop culture on steroids.","url":"http://www.mtv.com/news","category":"entertainment","language":"en","country":"us"},{"id":"mtv-news-uk","name":"MTV News (UK)","description":"All the latest celebrity news, gossip, exclusive interviews and pictures from the world of music and entertainment.","url":"http://www.mtv.co.uk/news","category":"entertainment","language":"en","country":"gb"},{"id":"polygon","name":"Polygon","description":"Polygon is a gaming website in partnership with Vox Media. Our culture focused site covers games, their creators, the fans, trending stories and entertainment news.","url":"http://www.polygon.com","category":"entertainment","language":"en","country":"us"},{"id":"the-lad-bible","name":"The Lad Bible","description":"The LAD Bible is one of the largest community for guys aged 16-30 in the world. Send us your funniest pictures and videos!","url":"https://www.theladbible.com","category":"entertainment","language":"en","country":"gb"}]

class SourcesResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourcesResponse({this.status, this.sources});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
