class StoriesEntity {
  StoriesEntity({
    List<Data>? data,
    Pagination? pagination,
  }) {
    _data = data;
    _pagination = pagination;
  }

  StoriesEntity.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<Data>? _data;
  Pagination? _pagination;

  StoriesEntity copyWith({
    List<Data>? data,
    Pagination? pagination,
  }) =>
      StoriesEntity(
        data: data ?? _data,
        pagination: pagination ?? _pagination,
      );

  List<Data>? get data => _data;

  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }
}

class Pagination {
  Pagination({
    num? totalRecords,
    num? currentPage,
    num? totalPages,
    num? nextPage,
    dynamic prevPage,
  }) {
    _totalRecords = totalRecords;
    _currentPage = currentPage;
    _totalPages = totalPages;
    _nextPage = nextPage;
    _prevPage = prevPage;
  }

  Pagination.fromJson(dynamic json) {
    _totalRecords = json['total_records'];
    _currentPage = json['current_page'];
    _totalPages = json['total_pages'];
    _nextPage = json['next_page'];
    _prevPage = json['prev_page'];
  }

  num? _totalRecords;
  num? _currentPage;
  num? _totalPages;
  num? _nextPage;
  dynamic _prevPage;

  Pagination copyWith({
    num? totalRecords,
    num? currentPage,
    num? totalPages,
    num? nextPage,
    dynamic prevPage,
  }) =>
      Pagination(
        totalRecords: totalRecords ?? _totalRecords,
        currentPage: currentPage ?? _currentPage,
        totalPages: totalPages ?? _totalPages,
        nextPage: nextPage ?? _nextPage,
        prevPage: prevPage ?? _prevPage,
      );

  num? get totalRecords => _totalRecords;

  num? get currentPage => _currentPage;

  num? get totalPages => _totalPages;

  num? get nextPage => _nextPage;

  dynamic get prevPage => _prevPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_records'] = _totalRecords;
    map['current_page'] = _currentPage;
    map['total_pages'] = _totalPages;
    map['next_page'] = _nextPage;
    map['prev_page'] = _prevPage;
    return map;
  }
}

class Data {
  Data({
    String? id,
    String? location,
    bool? liked,
    String? description,
    List<String>? images,
    List<Hotels>? hotels,
    List<Foods>? foods,
    User? user,
    String? createdAt,
  }) {
    _id = id;
    _location = location;
    _liked = liked;
    _description = description;
    _images = images;
    _hotels = hotels;
    _foods = foods;
    _user = user;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _location = json['location'];
    _liked = json['liked'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['hotels'] != null) {
      _hotels = [];
      json['hotels'].forEach((v) {
        _hotels?.add(Hotels.fromJson(v));
      });
    }
    if (json['foods'] != null) {
      _foods = [];
      json['foods'].forEach((v) {
        _foods?.add(Foods.fromJson(v));
      });
    }
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _createdAt = json['created_at'];
  }

  String? _id;
  String? _location;
  bool? _liked;
  String? _description;
  List<String>? _images;
  List<Hotels>? _hotels;
  List<Foods>? _foods;
  User? _user;
  String? _createdAt;

  Data copyWith({
    String? id,
    String? location,
    bool? liked,
    String? description,
    List<String>? images,
    List<Hotels>? hotels,
    List<Foods>? foods,
    User? user,
    String? createdAt,
  }) =>
      Data(
        id: id ?? _id,
        location: location ?? _location,
        liked: liked ?? _liked,
        description: description ?? _description,
        images: images ?? _images,
        hotels: hotels ?? _hotels,
        foods: foods ?? _foods,
        user: user ?? _user,
        createdAt: createdAt ?? _createdAt,
      );

  String? get id => _id;

  String? get location => _location;

  bool? get liked => _liked;

  String? get description => _description;

  List<String>? get images => _images;

  List<Hotels>? get hotels => _hotels;

  List<Foods>? get foods => _foods;

  User? get user => _user;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['location'] = _location;
    map['liked'] = _liked;
    map['description'] = _description;
    map['images'] = _images;
    if (_hotels != null) {
      map['hotels'] = _hotels?.map((v) => v.toJson()).toList();
    }
    if (_foods != null) {
      map['foods'] = _foods?.map((v) => v.toJson()).toList();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['created_at'] = _createdAt;
    return map;
  }
}

class User {
  User({
    String? userName,
    String? userImage,
  }) {
    _userName = userName;
    _userImage = userImage;
  }

  User.fromJson(dynamic json) {
    _userName = json['userName'];
    _userImage = json['userImage'];
  }

  String? _userName;
  String? _userImage;

  User copyWith({
    String? userName,
    String? userImage,
  }) =>
      User(
        userName: userName ?? _userName,
        userImage: userImage ?? _userImage,
      );

  String? get userName => _userName;

  String? get userImage => _userImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = _userName;
    map['userImage'] = _userImage;
    return map;
  }
}

class Foods {
  Foods({
    String? foodName,
    String? restaurantName,
  }) {
    _foodName = foodName;
    _restaurantName = restaurantName;
  }

  Foods.fromJson(dynamic json) {
    _foodName = json['foodName'];
    _restaurantName = json['restaurantName'];
  }

  String? _foodName;
  String? _restaurantName;

  Foods copyWith({
    String? foodName,
    String? restaurantName,
  }) =>
      Foods(
        foodName: foodName ?? _foodName,
        restaurantName: restaurantName ?? _restaurantName,
      );

  String? get foodName => _foodName;

  String? get restaurantName => _restaurantName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodName'] = _foodName;
    map['restaurantName'] = _restaurantName;
    return map;
  }
}

class Hotels {
  Hotels({
    String? hotelName,
    String? hotelLocation,
  }) {
    _hotelName = hotelName;
    _hotelLocation = hotelLocation;
  }

  Hotels.fromJson(dynamic json) {
    _hotelName = json['hotelName'];
    _hotelLocation = json['hotelLocation'];
  }

  String? _hotelName;
  String? _hotelLocation;

  Hotels copyWith({
    String? hotelName,
    String? hotelLocation,
  }) =>
      Hotels(
        hotelName: hotelName ?? _hotelName,
        hotelLocation: hotelLocation ?? _hotelLocation,
      );

  String? get hotelName => _hotelName;

  String? get hotelLocation => _hotelLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotelName'] = _hotelName;
    map['hotelLocation'] = _hotelLocation;
    return map;
  }
}
