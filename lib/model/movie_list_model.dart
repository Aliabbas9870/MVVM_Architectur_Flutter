 class MovieModel {
    dynamic? currentPage;
    List<Data>? data;
    String? firstPageUrl;
    dynamic? from;
    String? nextPageUrl;
    String? path;
    dynamic? perPage;
    dynamic prevPageUrl;
    dynamic? to;

    MovieModel({this.currentPage, this.data, this.firstPageUrl, this.from, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to});

    MovieModel.fromJson(Map<String, dynamic> json) {
        currentPage = json["current_page"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
        firstPageUrl = json["first_page_url"];
        from = json["from"];
        nextPageUrl = json["next_page_url"];
        path = json["path"];
        perPage = json["per_page"];
        prevPageUrl = json["prev_page_url"];
        to = json["to"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["current_page"] = currentPage;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        _data["first_page_url"] = firstPageUrl;
        _data["from"] = from;
        _data["next_page_url"] = nextPageUrl;
        _data["path"] = path;
        _data["per_page"] = perPage;
        _data["prev_page_url"] = prevPageUrl;
        _data["to"] = to;
        return _data;
    }
}

class Data {
    String? id;
    dynamic? movieId;
    String? originalTitle;
    String? originalLanguage;
    String? overview;
    dynamic? popularity;
    String? posterPath;
    String? backdropPath;
    String? releaseDate;
    dynamic? voteAverage;
    dynamic? voteCount;
    dynamic? adult;
    dynamic createdAt;
    dynamic updatedAt;
    List<Casts>? casts;

    Data({this.id, this.movieId, this.originalTitle, this.originalLanguage, this.overview, this.popularity, this.posterPath, this.backdropPath, this.releaseDate, this.voteAverage, this.voteCount, this.adult, this.createdAt, this.updatedAt, this.casts});

    Data.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        movieId = json["movie_id"];
        originalTitle = json["original_title"];
        originalLanguage = json["original_language"];
        overview = json["overview"];
        popularity = json["popularity"];
        posterPath = json["poster_path"];
        backdropPath = json["backdrop_path"];
        releaseDate = json["release_date"];
        voteAverage = json["vote_average"];
        voteCount = json["vote_count"];
        adult = json["adult"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        casts = json["casts"] == null ? null : (json["casts"] as List).map((e) => Casts.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["movie_id"] = movieId;
        _data["original_title"] = originalTitle;
        _data["original_language"] = originalLanguage;
        _data["overview"] = overview;
        _data["popularity"] = popularity;
        _data["poster_path"] = posterPath;
        _data["backdrop_path"] = backdropPath;
        _data["release_date"] = releaseDate;
        _data["vote_average"] = voteAverage;
        _data["vote_count"] = voteCount;
        _data["adult"] = adult;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        if(casts != null) {
            _data["casts"] = casts?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Casts {
    String? id;
    dynamic? movieId;
    String? name;
    String? originalName;
    String? popularity;
    String? profilePath;
    String? character;
    dynamic createdAt;
    dynamic updatedAt;

    Casts({this.id, this.movieId, this.name, this.originalName, this.popularity, this.profilePath, this.character, this.createdAt, this.updatedAt});

    Casts.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        movieId = json["movie_id"];
        name = json["name"];
        originalName = json["original_name"];
        popularity = json["popularity"];
        profilePath = json["profile_path"];
        character = json["character"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["movie_id"] = movieId;
        _data["name"] = name;
        _data["original_name"] = originalName;
        _data["popularity"] = popularity;
        _data["profile_path"] = profilePath;
        _data["character"] = character;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}