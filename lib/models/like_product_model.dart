class LikeProduct {
  final int likeProductId;
  final int userId;
  final int productId;
  LikeProductLinks links;

  LikeProduct({
    required this.likeProductId,
    required this.userId,
    required this.productId,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory LikeProduct.fromJson(Map<String, dynamic> parsedJson) {
    return LikeProduct(
      likeProductId: parsedJson['id'],
      userId: parsedJson['user_id'],
      productId: parsedJson['product_id'],
      links: LikeProductLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'like_product_id': likeProductId,
      'user_id': userId,
      'product_id': productId,
    };
  }
}

/////////////////// LikeProduct Links Model ///////////////////
class LikeProductLinks {
  String selfLink;
  String userLink;
  String productLink;

  LikeProductLinks({
    required this.selfLink,
    required this.userLink,
    required this.productLink,
  });

  factory LikeProductLinks.fromJson(dynamic parsedJson) {
    return LikeProductLinks(
      selfLink: parsedJson['self'],
      userLink: parsedJson['user'],
      productLink: parsedJson['product'],
    );
  }
}