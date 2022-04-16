import 'package:flutter/material.dart';

import '../../models/health_blog_model.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/themes.dart';
import '../../widgets/constrained_centre.dart';
import 'components/health_blog_scaffold_widget.dart';

class HealthBlogPage extends StatelessWidget {
  final HealthBlog healthBlog;
  const HealthBlogPage({Key? key, required this.healthBlog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _healthBlogPictoUrl = ApiUrl.healthBlogPictoLink + healthBlog.pictoFile;
    debugPrint('health_blog_page healthBlogPictoUrl: $_healthBlogPictoUrl \n\n');

    // Separating children contents from HealthBlogScaffold here.
    return HealthBlogScaffoldWidget(
      children: [
        ConstrainedCentre(
          child: SizedBox(
            height: ScreenSize.height * 0.2,
            width: ScreenSize.width * 1,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(_healthBlogPictoUrl),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SelectableText(
          'Written by ${healthBlog.authorName}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 40),
        SelectableText(
          healthBlog.title,
          style:Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        SelectableText(
          healthBlog.createdOn,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 20),
        SelectableText(
          healthBlog.body,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}