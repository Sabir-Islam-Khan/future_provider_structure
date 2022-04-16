class LikeBusiness {
  final int likeBusinessId;
  final int userId;
  final int businessId;
  LikeBusinessLinks links;

  LikeBusiness({
    required this.likeBusinessId,
    required this.userId,
    required this.businessId,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory LikeBusiness.fromJson(Map<String, dynamic> parsedJson) {
    return LikeBusiness(
      likeBusinessId: parsedJson['id'],
      userId: parsedJson['user_id'],
      businessId: parsedJson['business_id'],
      links: LikeBusinessLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'like_business_id': likeBusinessId,
      'user_id': userId,
      'business_id': businessId,
    };
  }
}

/////////////////// LikeBusiness Links Model ///////////////////
class LikeBusinessLinks {
  String selfLink;
  String userLink;
  String businessLink;

  LikeBusinessLinks({
    required this.selfLink,
    required this.userLink,
    required this.businessLink,
  });

  factory LikeBusinessLinks.fromJson(dynamic parsedJson) {
    return LikeBusinessLinks(
      selfLink: parsedJson['self'],
      userLink: parsedJson['user'],
      businessLink: parsedJson['business'],
    );
  }
}