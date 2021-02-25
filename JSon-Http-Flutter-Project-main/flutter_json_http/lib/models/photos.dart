
class Photos {

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

	Photos.fromJsonMap(Map<String, dynamic> map): 
		albumId = map["albumId"],
		id = map["id"],
		title = map["title"],
		url = map["url"],
		thumbnailUrl = map["thumbnailUrl"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['albumId'] = albumId;
		data['id'] = id;
		data['title'] = title;
		data['url'] = url;
		data['thumbnailUrl'] = thumbnailUrl;
		return data;
	}
}
