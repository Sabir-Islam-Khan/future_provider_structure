import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jaaba/models/booking_model.dart';
import 'package:jaaba/models/company_model.dart';
import 'package:jaaba/screens/booked_clinic/bookedClinic.dart';

import '../../../utils/themes.dart';

Widget bookingTabWidget(
    BuildContext context, String timeString, String model, Booking clinic) {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  DateTime localTime;
  int? date;

  int monthNumber;

  String monthName;

  String year;

  DateTime time = DateTime.parse(timeString);
  localTime = time.toLocal();
  date = localTime.day;
  monthNumber = localTime.month;
  monthName = months[monthNumber - 1];
  year = localTime.year.toString();

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookedClinic(
            company: Company(
              name: clinic.name,
              block: clinic.block,
              building: clinic.building,
              businessRadius: clinic.businessRadius,
              city: clinic.city,
              companyId: clinic.companyId,
              countryName: clinic.countryName,
              createdOn: clinic.createdOn,
              floorNum: clinic.floorNum,
              lat: clinic.lat,
              links: CompanyLinks(
                selfLink: clinic.links!.selfLink,
                logoFileLink: clinic.links!.logoFileLink,
                productLink: clinic.links!.productLink,
              ),
              logoFile: clinic.logoFile,
              lon: clinic.lon,
              postalCode: clinic.postalCode,
              state: clinic.state,
              street: clinic.street,
              unitNum: clinic.unitNum,
            ),
          ),
        ),
      );
    },
    child: Container(
      color: globalColor_12LightGrey,
      height: ScreenSize.height * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ScreenSize.width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '$date $monthName',
                style: GoogleFonts.roboto(
                  fontSize: ScreenSize.height * 0.033,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(
                    255,
                    17,
                    34,
                    65,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    year + " | ",
                    style: GoogleFonts.roboto(
                      fontSize: ScreenSize.height * 0.019,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(
                        255,
                        17,
                        34,
                        65,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat.jm().format(
                      DateTime.parse(localTime.toString()),
                    ),
                    style: GoogleFonts.roboto(
                      fontSize: ScreenSize.height * 0.019,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(
                        255,
                        17,
                        34,
                        65,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model,
                style: GoogleFonts.roboto(
                  fontSize: ScreenSize.height * 0.03,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(
                    255,
                    17,
                    34,
                    65,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '     Appointment',
                  style: GoogleFonts.roboto(
                    fontSize: ScreenSize.height * 0.022,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(
                      255,
                      17,
                      34,
                      65,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: ScreenSize.width * 0.05,
          ),
        ],
      ),
    ),
  );
}
