import 'package:flutter/material.dart';
import 'package:jaaba/screens/home/components/beizer_widget.dart';
import 'package:jaaba/screens/home/components/blog_post_card.dart';
import 'package:jaaba/screens/home/components/booking_tab_widget.dart';
import 'package:jaaba/screens/home/components/section_choice_widget.dart';
import 'package:jaaba/services/company_api_service.dart';
import 'package:jaaba/utils/environment_variables.dart';
import 'package:jaaba/utils/themes.dart';
import 'package:provider/provider.dart';

import '../../models/booking_model.dart';
import '../../models/company_model.dart';
import '../../models/user_model.dart';
import '../../models/cart_model.dart';
import '../../models/cart_item_model.dart';
import '../../models/currency_model.dart';
import '../../models/health_blog_model.dart';

import '../../utils/api_endpoints.dart';
import 'components/home_scaffold_widget.dart';

class HomePage extends StatelessWidget {
  final ScrollController? controller;
  const HomePage({Key? key, @required this.controller}) : super(key: key);

  get blog => null; // ?????????????????????????????????????????????????

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final Cart cart = Provider.of<Cart>(context);
    final List<CartItem> cartItem = Provider.of<List<CartItem>>(context);
    final List<Currency> currencies = Provider.of<List<Currency>>(context);
    final List<HealthBlog> blogs = Provider.of<List<HealthBlog>>(context);
    final List<Company> companies = Provider.of<List<Company>>(context);
    // Cart cart = Provider.of<Cart>(context);
    final List<Booking> bookings = Provider.of<List<Booking>>(context);

    debugPrint("USER ID IS ======= \n\n\n\n\n\n\n\n $userId \n\n\n\n");
    // Separating children contents from HomeScaffold here.
    return HomeScaffoldWidget(
      children: [
        //// top curved container section  ///
        Stack(
          children: [
            beizerWidget(ScreenSize.width),
            Positioned(
              top: 20.0,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize.width * 0.1,
                ),
                child: const Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 55.0,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize.width * 0.1,
                ),
                child: user.userName.isNotEmpty
                    ? Text(
                        "${user.designation} ${user.userName}",
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        //// Row for page selection containers //////
        sectionChoiceWidget(context, companies),
        //////////// Listview for blog posts ////////
        const SizedBox(
          height: 10.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: paleSkyBlue,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              bookings.isNotEmpty
                  ? const SizedBox(
                      height: 15.0,
                    )
                  : const SizedBox.shrink(),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookings.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ///// blog post widget ///////////
                    return Column(
                      children: [
                        bookingTabWidget(context, bookings[index].createdOn!,
                            bookings[index].model!, bookings[index]),
                        Container(
                          color: globalColor_14DarkGrey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  SizedBox(
                                    height: 60.0,
                                    width: 60.0,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.network(
                                          ApiUrl.companyLogoFileLink +
                                              bookings[index].logoFile!),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: ScreenSize.width * 0.5,
                                        child: Text(
                                          bookings[index].name!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        bookings[index].building!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        bookings[index].street!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        bookings[index].countryName! +
                                            " " +
                                            bookings[index].postalCode!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "+65 68832883",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: blogs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ///// blog post widget ///////////
                  return Align(
                    alignment: Alignment.center,
                    child: BlogPostCard(
                      blogDetails: blogs[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
