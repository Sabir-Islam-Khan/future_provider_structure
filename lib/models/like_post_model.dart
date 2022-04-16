class LikePost {
  final int likePostId;
  final int userId;
  final int postId;
  LikePostLinks links;

  LikePost({
    required this.likePostId,
    required this.userId,
    required this.postId,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory LikePost.fromJson(Map<String, dynamic> parsedJson) {
    return LikePost(
      likePostId: parsedJson['id'],
      userId: parsedJson['user_id'],
      postId: parsedJson['post_id'],
      links: LikePostLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'like_post_id': likePostId,
      'user_id': userId,
      'post_id': postId,
    };
  }
}

/////////////////// LikePost Links Model ///////////////////
class LikePostLinks {
  String selfLink;
  String userLink;
  String postLink;

  LikePostLinks({
    required this.selfLink,
    required this.userLink,
    required this.postLink,
  });

  factory LikePostLinks.fromJson(dynamic parsedJson) {
    return LikePostLinks(
      selfLink: parsedJson['self'],
      userLink: parsedJson['user'],
      postLink: parsedJson['post'],
    );
  }
}