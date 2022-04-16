import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jaaba/services/booking_api_service.dart';
import 'package:jaaba/services/company_api_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../models/company_model.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/environment_variables.dart';
import '../../utils/themes.dart';
import '../company/components/accepted_methods_widget.dart';
import '../company/components/consultation_widget.dart';
import '../company/components/delivery_widget.dart';
import '../company/components/procedure_section_widget.dart';
import '../company/components/times_section_widget.dart';

class BookedClinic extends StatefulWidget {
  final Company? company;
  const BookedClinic({Key? key, @required this.company}) : super(key: key);

  @override
  State<BookedClinic> createState() => _BookedClinicState();
}

class _BookedClinicState extends State<BookedClinic>
    with TickerProviderStateMixin {
  MapController mapController = MapController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            bottomNavigationBar: Container(
              height: ScreenSize.height * 0.08,
              width: ScreenSize.width * 1,
              color: globalColor_13DarkBlue,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenSize.width * 0.57,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(
                          () {
                            isLoading = true;
                          },
                        );

                        BookingApiService().deleteBooking(
                          context,
                          widget.company!.companyId!,
                        );
                      },
                      child: Container(
                        height: ScreenSize.height * 0.05,
                        width: ScreenSize.width * 0.37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red[800],
                        ),
                        child: const Center(
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Transform.scale(
                scale: 0.7,
                child: ClipOval(
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    color: Colors.grey[200],
                    child: InkWell(
                      splashColor: Colors.red[200],
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
            ),
            body: SlidingUpPanel(
              maxHeight: ScreenSize.height * 0.9,
              renderPanelSheet: false,
              minHeight: ScreenSize.height * 0.5,
              parallaxEnabled: true,
              parallaxOffset: 0.6,
              panelBuilder: (homeScrollController) => buildSlidePanel(
                homeScrollController: homeScrollController,
                context: context,
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
                        center:
                            LatLng(widget.company!.lat!, widget.company!.lon!),
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
                              point: LatLng(
                                  widget.company!.lat!, widget.company!.lon!),
                              builder: (context) => SizedBox(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(
                                      'assets/logo/clinic_logo.png'),
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
          );
  }

  Widget buildSlidePanel({
    @required ScrollController? homeScrollController,
    BuildContext? context,
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
                              child: Image.network(ApiUrl.companyLogoFileLink +
                                  widget.company!.logoFile!),
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
                                  widget.company!.name!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                widget.company!.building!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.company!.street!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.company!.countryName! +
                                    " " +
                                    widget.company!.postalCode!,
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
}
