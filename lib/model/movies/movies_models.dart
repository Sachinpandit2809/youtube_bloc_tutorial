class MoviesModel {
  int? total;
  int? page;
  int? pages;
  List<TvShows>? tvShows;

  MoviesModel({this.total, this.page, this.pages, this.tvShows});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["pages"] is int) {
      pages = json["pages"];
    }
    if (json["tv_shows"] is List) {
      tvShows = json["tv_shows"] == null
          ? null
          : (json["tv_shows"] as List).map((e) => TvShows.fromJson(e)).toList();
    }
  }

  static List<MoviesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MoviesModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["page"] = page;
    _data["pages"] = pages;
    if (tvShows != null) {
      _data["tv_shows"] = tvShows?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class TvShows {
  int? id;
  String? name;
  String? permalink;
  String? startDate;
  dynamic endDate;
  String? country;
  String? network;
  String? status;
  String? imageThumbnailPath;

  TvShows(
      {this.id,
      this.name,
      this.permalink,
      this.startDate,
      this.endDate,
      this.country,
      this.network,
      this.status,
      this.imageThumbnailPath});

  TvShows.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["permalink"] is String) {
      permalink = json["permalink"];
    }
    if (json["start_date"] is String) {
      startDate = json["start_date"];
    }
    endDate = json["end_date"];
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["network"] is String) {
      network = json["network"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["image_thumbnail_path"] is String) {
      imageThumbnailPath = json["image_thumbnail_path"];
    }
  }

  static List<TvShows> fromList(List<Map<String, dynamic>> list) {
    return list.map(TvShows.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["permalink"] = permalink;
    _data["start_date"] = startDate;
    _data["end_date"] = endDate;
    _data["country"] = country;
    _data["network"] = network;
    _data["status"] = status;
    _data["image_thumbnail_path"] = imageThumbnailPath;
    return _data;
  }
}
