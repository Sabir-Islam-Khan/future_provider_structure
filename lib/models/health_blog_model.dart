/*
The Post class below represents the Post json from our web application.
As a result, rather than reading the data as
parsedJson['authorId']; // dynamic
parsedJson['authorName']; // dynamic
We can read like this:
post.authorId; // guaranteed non-nullable and immutable
post.authorName;  // guaranteed non-nullable and immutable

final jsonData = '{ "authorId": 1, "authorName": "Alex"}';
final parsedJson = jsonDecode(jsonData);
final post = Post.fromJson(parsedJson);
*/

class HealthBlog {
  final int postId;
  final int authorId;
  final String authorName;
  final String authorSelfie;
  final String title;
  final String body;
  final String pictoFile;
  final String createdOn;

  // format dataTime
  //String get date => DateFormat("d MMMM y").format(createdOn);

  // constructor
  HealthBlog({
    required this.postId,
    required this.authorId,
    required this.authorName,
    required this.authorSelfie,
    required this.title,
    required this.body,
    required this.pictoFile,
    required this.createdOn,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory HealthBlog.fromJson(Map<String, dynamic> parsedJson) {
    return HealthBlog(
      postId: parsedJson['id'],
      authorId: parsedJson['author_id'],
      authorName: parsedJson['author_name'],
      authorSelfie: parsedJson['author_selfie'],
      title: parsedJson['title'],
      body: parsedJson['body'],
      pictoFile: parsedJson['picto_file'],
      createdOn: parsedJson['created_on'],
    );
  }
}