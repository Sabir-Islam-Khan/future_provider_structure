import 'package:flutter/material.dart';

import '../../../models/health_blog_model.dart';
import '../../../utils/api_endpoints.dart';
import '../../../utils/themes.dart';
import '../health_blog_page.dart';

class HealthBlogTileWidget extends StatelessWidget {
  final HealthBlog healthBlog;
  const HealthBlogTileWidget({Key? key, required this.healthBlog}) : super(key: key);

  @override
  Widget build(context) {
    final authorSelfieUrl = ApiUrl.baseURL + healthBlog.authorSelfie;
    debugPrint('HealthBlogListTile authorSelfie: ${healthBlog.authorSelfie} \n\n');
    debugPrint('HealthBlogListTile authorSelfieUrl: $authorSelfieUrl \n\n');
    final _healthBlogPictoUrl = ApiUrl.healthBlogPictoLink + healthBlog.pictoFile;
    debugPrint('HealthBlogListTile _healthBlogPictoUrl: $_healthBlogPictoUrl \n\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenSize.height * 0.355,
          width: ScreenSize.width * 0.97,
          child: Card(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: ScreenSize.width * 0.03,
                    ),
                    /////////////////////// authorSelfie ///////////////////////
                    ClipOval(
                      child: SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(authorSelfieUrl),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.02,
                    ),
                    SizedBox(
                      height: 50.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7.0),
                          //////////////////// authorName  ////////////////////
                          Text(
                            healthBlog.authorName,
                            style: TextStyle(
                              fontSize: ScreenSize.height * 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ///////////////////// createdOn /////////////////////
                          Text(
                            healthBlog.createdOn,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),

                Center(
                  ////////////////////////// onTap //////////////////////////
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return HealthBlogPage(healthBlog: healthBlog);
                          }
                      ));
                    },
                    /////////////////////// pictoFile ///////////////////////
                    child: SizedBox(
                      height: ScreenSize.height * 0.2,
                      width: ScreenSize.width * 1,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(_healthBlogPictoUrl),
                      ),
                    ),
                  ),
                ),
                /////////////////////// title ////////////////////////
                Row(
                  children: [
                    Container(
                      width: ScreenSize.width * 0.8,
                      padding: EdgeInsets.only(
                        left: ScreenSize.width * 0.025,
                        right: ScreenSize.width * 0.025,
                      ),
                      child: Text(healthBlog.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ScreenSize.height * 0.025,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: ScreenSize.width * 0.05),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}