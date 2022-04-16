import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jaaba/screens/company/components/accepted_methods_widget.dart';
import 'package:jaaba/screens/company/components/consultation_widget.dart';
import 'package:jaaba/screens/company/components/delivery_widget.dart';
import 'package:jaaba/screens/company/components/procedure_section_widget.dart';
import 'package:jaaba/screens/company/components/times_section_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../utils/environment_variables.dart';
import 'components/company_scaffold_widget.dart';
import '../../models/company_model.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/themes.dart';
import 'package:latlong2/latlong.dart';

class CompanyPage extends StatefulWidget {
  final Company company;
  CompanyPage({Key? key, required this.company}) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with TickerProviderStateMixin {
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return CompanyScaffoldWidget(
      children: SlidingUpPanel(
        maxHeight: ScreenSize.height * 0.8,
        renderPanelSheet: false,
        minHeight: ScreenSize.height * 0.5,
        parallaxEnabled: true,
        parallaxOffset: 0.6,
        panelBuilder: (homeScrollController) => buildSlidePanel(
          homeScrollController: homeScrollController,
          context: context,
          company: widget.company,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: ScreenSize.height * 0.6,
              width: ScreenSize.width * 1,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  plugins: [
                    // DragMarkerPlugin(),
                  ],
                  center: LatLng(widget.company.lat!, widget.company.lon!),
                  zoom: 13.0,
                  maxZoom: 18.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: mapboxURL,
                    additionalOptions: {
                      'accessToken': mapBoxToken,
                      'id': mapBoxID
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 85,
                        height: 85,
                        point: LatLng(widget.company.lat!, widget.company.lon!),
                        builder: (context) => SizedBox(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('assets/logo/clinic_logo.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      company: widget.company,
    );
  }
}

Widget buildSlidePanel({
  @required ScrollController? homeScrollController,
  BuildContext? context,
  Company? company,
}) {
  return Container(
    decoration: BoxDecoration(
      color: globalColor_14DarkGrey,
      borderRadius: BorderRadius.circular(00.0),
    ),
    child: SingleChildScrollView(
      controller: homeScrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Column(
            children: [
              Container(
                width: ScreenSize.width,
                color: globalColor_14DarkGrey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenSize.height * 0.02,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          height: 80.0,
                          width: 100.0,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                              ApiUrl.companyLogoFileLink + company!.logoFile!,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: ScreenSize.width * 0.5,
                              child: Text(
                                company.name!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              company.building!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              company.street!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              company.countryName! + " " + company.postalCode!,
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
                      height: 15.0,
                    ),
                    consultationWidget(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    deliverySectionWidget(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    procedureSectionWidget(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    timesSectionWidget(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    acceptedMethodSectionWidget(),
                    const SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
