import 'package:flutter/material.dart';
import 'package:jaaba/models/health_blog_model.dart';
import 'package:jaaba/utils/api_endpoints.dart';
import 'package:jaaba/utils/themes.dart';

class BlogPostCard extends StatelessWidget {
  final HealthBlog? blogDetails;
  const BlogPostCard({Key? key, @required this.blogDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Container(
        color: Colors.white,
        width: ScreenSize.width * 0.96,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(ApiUrl.baseURL + blogDetails!.authorSelfie),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blogDetails!.authorName,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "3 Hrs",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 20.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: ScreenSize.height * 0.2,
              width: double.maxFinite,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                  ApiUrl.healthBlogPictoLink + blogDetails!.pictoFile,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
              ),
              child: Text(
                blogDetails!.createdOn.substring(0, 10),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
              ),
              child: Text(
                blogDetails!.body,
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
