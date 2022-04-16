import 'package:flutter/material.dart';

import '../../../models/company_model.dart';
import '../../../models/product_model.dart';
import '../../../utils/themes.dart';
import '../../care_provider/care_provider_page.dart';
import '../../marketplace/marketplace_page.dart';

class HealthServicesWidget extends StatelessWidget {
  final List<Company> companies;
  final List<Product> products;
  const HealthServicesWidget({Key? key, required this.companies, required this.products })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //////////////////////// Tele-consult GP ////////////////////////
        Container(
          height: ScreenSize.height * 0.2,
          width: ScreenSize.width * 0.5,
          color: paleBlueGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenSize.height * 0.025,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return CareProviderPage(companies: companies);
                        }
                    ));
                  },
                  child: Container(
                    height: 75.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'assets/logo/teleconsult_logo.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Center(
                child: Text(
                  "Teleconsult GP \nDoctor",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        /////////////////////////// Marketplace ///////////////////////////
        Container(
          height: ScreenSize.height * 0.2,
          width: ScreenSize.width * 0.5,
          color: deepBlueGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenSize.height * 0.02,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return MarketplacePage(products: products);
                        }
                    ));
                  },
                  child: Container(
                    height: 75,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'assets/logo/marketplace_icon.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Center(
                child: Text(
                  "Shop at \nMarketplace",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}