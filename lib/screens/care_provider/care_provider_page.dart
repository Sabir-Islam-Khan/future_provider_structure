import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../models/company_model.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/themes.dart';
import '../company/company_page.dart';
import '../company/components/company_tile_widget.dart';
import 'functions/animate_map.dart';
import '../../utils/environment_variables.dart';

class CareProviderPage extends StatefulWidget {
  final List<Company> companies;
  const CareProviderPage({Key? key, required this.companies}) : super(key: key);

  @override
  State<CareProviderPage> createState() => _CareProviderPageState();
}

class _CareProviderPageState extends State<CareProviderPage>
    with TickerProviderStateMixin {
  MapController mapController = MapController();

  void initialise() async {
    // setUserDetails();
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    animatedMap(LatLng(userLat!, userLon!), 14, this, mapController);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => initialise());
  }

////////// function to set markers //////////////////////

  List<Marker> getMarkers(
    BuildContext context,
    int radius,
  ) {
    final Distance distance = Distance();
    List<Marker> list = [];

    list.add(
      Marker(
        width: 80,
        height: 80,
        point: LatLng(userLat!, userLon!),
        builder: (context) => SizedBox(
          height: 75.0,
          width: 75.0,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/gifs/user_location.gif"),
          ),
        ),
      ),
    );
    for (int i = 0; i < widget.companies.length; i++) {
      final double km = distance.as(
        LengthUnit.Kilometer,
        LatLng(widget.companies[i].lat!, widget.companies[i].lon!),
        LatLng(userLat!, userLon!),
      );
      if (km <= radius) {
        list.add(
          Marker(
            width: 80,
            height: 80,
            point: LatLng(
              widget.companies[i].lat!,
              widget.companies[i].lon!,
            ),
            builder: (context) => GestureDetector(
              onTap: () {},
              child: SizedBox(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/logo/clinic_logo.png'),
                ),
              ),
            ),
          ),
        );
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          comanyList: widget.companies,
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
                  center: LatLng(userLat!, userLon!),
                  zoom: 10.0,
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
                    markers: getMarkers(context, 30),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: ScreenSize.height * 0.52,
              child: Container(
                padding: EdgeInsets.only(
                  left: ScreenSize.width * 0.04,
                  right: ScreenSize.width * 0.04,
                ),
                width: ScreenSize.width * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Colors.red[200],
                          child: SizedBox(
                            width: 46,
                            height: 46,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                  'assets/logo/center_location.png'),
                            ),
                          ),
                          onTap: () {
                            animatedMap(LatLng(userLat!, userLon!), 14, this,
                                mapController);
                          }, //Missing Search function
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlidePanel(
      {@required ScrollController? homeScrollController,
      BuildContext? context,
      List<Company>? comanyList}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 237, 251),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 1.0,
            width: 50.0,
            color: Colors.grey[500],
          ),
          const SizedBox(
            height: 2.0,
          ),
          Container(
            height: 1.0,
            width: 50.0,
            color: Colors.grey[500],
          ),
          const SizedBox(
            height: 10.0,
          ),
          MediaQuery.removePadding(
            context: context!,
            removeTop: true,
            child: GridView.builder(
              shrinkWrap: true,
              controller: homeScrollController,
              itemCount: comanyList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompanyPage(
                            company: comanyList[index],
                          ),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Container(
                                  height: ScreenSize.height * 0.12,
                                  width: ScreenSize.width * 0.31,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Image.network(
                                        ApiUrl.companyLogoFileLink +
                                            comanyList[index].logoFile!),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      comanyList[index].name!,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Text(
                                      "Book Now",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.orange),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      comanyList[index].street!,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[500],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 0.0,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Stack(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Color.fromARGB(255, 70, 96, 124),
                                      size: 32,
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.circle,
                                        color: Colors.black.withAlpha(100),
                                        size: 25,
                                      ),
                                    ),
                                    const Center(
                                      child: Text("Clinic",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10.0,
                            right: 10.0,
                            child: Icon(
                              Icons.star,
                              color: Colors.grey[500],
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
