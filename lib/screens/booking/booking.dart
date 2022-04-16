import 'package:flutter/material.dart';
import 'package:jaaba/models/company_model.dart';
import 'package:jaaba/utils/api_endpoints.dart';

import '../../services/booking_api_service.dart';
import '../../utils/themes.dart';

class BookingPage extends StatefulWidget {
  final Company? company;
  const BookingPage({Key? key, @required this.company}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool isLoading = false;

  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(),
            body: isLoading == true
                ? SizedBox(
                    height: ScreenSize.height * 1,
                    width: ScreenSize.width * 1,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: mainBlue,
                      ),
                    ),
                  )
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ScreenSize.height * 0.03,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40.0,
                                ),
                                SizedBox(
                                  height: ScreenSize.height * 0.1,
                                  width: ScreenSize.width * 0.1,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.network(
                                      ApiUrl.companyLogoFileLink +
                                          widget.company!.logoFile!,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                                SizedBox(
                                  width: ScreenSize.width * 0.5,
                                  child: Text(
                                    widget.company!.name!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Teleconsult',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " *",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Notes (optional)',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: TextFormField(
                                controller: notesController,
                                autofocus: false,
                                maxLines: 5,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                decoration: const InputDecoration(
                                    hintText: " Type here"),
                              ),
                            ),
                            SizedBox(
                              height: ScreenSize.height * 0.1,
                            ),
                            Center(
                              child: SizedBox(
                                height: ScreenSize.height * 0.08,
                                width: ScreenSize.width * 0.9,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    BookingApiService().createBooking(
                                      context,
                                      widget.company!.companyId!,
                                      notesController.value.text,
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>((states) {
                                      return globalColor_2Blue;
                                    }),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Book',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
  }
}
