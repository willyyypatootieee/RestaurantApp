class RestaurantListResult {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantListResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantListResult.fromJson(Map<String, dynamic> json) =>
      RestaurantListResult(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<Restaurant>.from(
            json['restaurants'].map((x) => Restaurant.fromJson(x))),
      );
}

class RestaurantDetailResult {
  final bool error;
  final String message;
  final RestaurantDetail restaurant;

  RestaurantDetailResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResult.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailResult(
        error: json['error'],
        message: json['message'],
        restaurant: RestaurantDetail.fromJson(json['restaurant']),
      );
}

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    pictureId: json['pictureId'],
    city: json['city'],
    rating: (json['rating'] as num).toDouble(),
  );
}

class RestaurantDetail extends Restaurant {
  final String address;
  final List<Category> categories;
  final Menus menus;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required String id,
    required String name,
    required String description,
    required String pictureId,
    required String city,
    required double rating,
    required this.address,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  }) : super(
    id: id,
    name: name,
    description: description,
    pictureId: pictureId,
    city: city,
    rating: rating,
  );

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: (json['rating'] as num).toDouble(),
        address: json['address'],
        categories: List<Category>.from(
            json['categories'].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json['menus']),
        customerReviews: List<CustomerReview>.from(
            json['customerReviews'].map((x) => CustomerReview.fromJson(x))),
      );
}

class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json['name'],
  );
}

class Menus {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<MenuItem>.from(
        json['foods'].map((x) => MenuItem.fromJson(x))),
    drinks: List<MenuItem>.from(
        json['drinks'].map((x) => MenuItem.fromJson(x))),
  );
}

class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
    name: json['name'],
  );
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      CustomerReview(
        name: json['name'],
        review: json['review'],
        date: json['date'],
      );
}
