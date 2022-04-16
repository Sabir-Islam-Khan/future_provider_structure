import 'dart:io';

import "package:flutter/material.dart";
import 'package:jaaba/screens/profile/components/label.dart';
import 'package:jaaba/screens/profile/components/text_field.dart';
import 'package:jaaba/services/user_api_service.dart';
import 'package:jaaba/utils/themes.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../models/user_model.dart';
import '../../utils/api_endpoints.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController givenNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController idNumberController = TextEditingController();

  TextEditingController nationalityController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  TextEditingController allergyController = TextEditingController();

  TextEditingController medicalConditionController = TextEditingController();

  String selectedDesignation = "";

  String selectedCountryCode = "";

  String selectedIdType = "";

  String selectedCurrency = "";

  List<String> designationTypes = [
    "Select Designation",
    "Mr",
    "Mrs",
    "Ms",
    "Mdm",
    "Prof",
    "Dr"
  ];

  List<String> identificationTypes = [
    "Select Identification",
    "e-KTP",
    "Passport",
    "NID"
  ];
  List<String> currencyTypes = [
    "Select Currency",
    "Singapore Dollar",
    "Malaysia Ringgit"
  ];

  List<String> countryCodes = ["Select Country Code", "+65", "+60", "+62"];
  User? user;
  @override
  void initState() {
    user = Provider.of<User>(context, listen: false);
    user!.designation.isNotEmpty
        ? selectedDesignation = user!.designation
        : selectedDesignation = designationTypes[0];
    user!.idType.isNotEmpty
        ? selectedIdType = user!.idType
        : selectedIdType = identificationTypes[0];
    user!.currencyName.isNotEmpty
        ? selectedCurrency = user!.currencyName
        : selectedCurrency = currencyTypes[0];
    user!.countryCode.isNotEmpty
        ? selectedCountryCode = user!.countryCode
        : selectedCountryCode = designationTypes[0];
    user!.userName.isNotEmpty
        ? userNameController = TextEditingController(text: user!.userName)
        : userNameController = TextEditingController(text: "");
    user!.lastName.isNotEmpty
        ? lastNameController = TextEditingController(text: user!.lastName)
        : lastNameController = TextEditingController(text: "");
    user!.givenName.isNotEmpty
        ? givenNameController = TextEditingController(text: user!.givenName)
        : givenNameController = TextEditingController(text: "");
    user!.email.isNotEmpty
        ? emailController = TextEditingController(text: user!.email)
        : emailController = TextEditingController(text: "");
    user!.phoneNum.isNotEmpty
        ? mobileNumberController = TextEditingController(text: user!.phoneNum)
        : mobileNumberController = TextEditingController(text: "");
    user!.idReg.isNotEmpty
        ? idNumberController = TextEditingController(text: user!.idReg)
        : idNumberController = TextEditingController(text: "");
    user!.nationality.isNotEmpty
        ? nationalityController = TextEditingController(text: user!.nationality)
        : nationalityController = TextEditingController(text: "");
    user!.languages.isNotEmpty
        ? languageController = TextEditingController(text: user!.languages)
        : languageController = TextEditingController(text: "");
    user!.allergies.isNotEmpty
        ? allergyController = TextEditingController(text: user!.allergies)
        : allergyController = TextEditingController(text: "");
    user!.preExisting.isNotEmpty
        ? medicalConditionController =
            TextEditingController(text: user!.preExisting)
        : medicalConditionController = TextEditingController(text: "");
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
    } else {
      setState(() {
        pickedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        "$identificationTypes    \n $selectedIdType \n $designationTypes \n $selectedDesignation \n");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: SizedBox(
                  height: 105.0,
                  width: 105.0,
                  child: Stack(
                    children: [
                      pickedImage == null
                          ? CircleAvatar(
                              radius: 45.0,
                              backgroundColor: globalColor_16Blue,
                              backgroundImage: NetworkImage(
                                  ApiUrl.userSelfieLink + user!.selfieFile),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              height: 60.0,
                              width: 60.0,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.file(pickedImage!),
                              ),
                            ),
                      Positioned(
                        bottom: 00.0,
                        right: 00.0,
                        child: GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: ClipOval(
                            child: Container(
                              color: globalColor_1Blue,
                              width: 30,
                              height: 30,
                              child: const Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    color: mainBlue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              label("Username"),
              textField(userNameController),
              const SizedBox(
                height: 10.0,
              ),
              label("Designation"),
              DropdownButton<String>(
                value: selectedDesignation,
                items: designationTypes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (String? val) {
                  setState(
                    () {
                      selectedDesignation = val!;
                    },
                  );
                },
                icon: Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -10),
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey[600],
                          size: ScreenSize.height * 0.022,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                elevation: 16,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                underline: Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              label("Last Name"),
              textField(lastNameController),
              const SizedBox(
                height: 10.0,
              ),
              label("Given Name"),
              textField(givenNameController),
              const SizedBox(
                height: 10.0,
              ),
              label("Email"),
              textField(emailController),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("Country Code"),
                      SizedBox(
                        width: ScreenSize.width * 0.4,
                        child: DropdownButton<String>(
                          value: selectedCountryCode,
                          items: countryCodes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          isExpanded: true,
                          onChanged: (String? val) {
                            setState(
                              () {
                                selectedCountryCode = val!;
                              },
                            );
                          },
                          icon: Row(
                            children: [
                              Transform.translate(
                                offset: const Offset(0, -10),
                                child: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.grey[600],
                                    size: ScreenSize.height * 0.022,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                          elevation: 16,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          underline: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: ScreenSize.width * 0.1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label("Mobile Number"),
                      SizedBox(
                        width: ScreenSize.width * 0.45,
                        child: textField(mobileNumberController),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              label("ID Type. (Government Issued)"),
              DropdownButton<String>(
                value: selectedIdType,
                items: identificationTypes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (String? val) {
                  setState(() {
                    selectedIdType = val!;
                  });
                },
                icon: Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -10),
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey[600],
                          size: ScreenSize.height * 0.022,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                elevation: 16,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                underline: Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              label("Preferred Currency"),
              DropdownButton<String>(
                value: selectedCurrency,
                items:
                    currencyTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (String? val) {
                  setState(() {
                    selectedCurrency = val!;
                  });
                },
                icon: Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -10),
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey[600],
                          size: ScreenSize.height * 0.022,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                elevation: 16,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                underline: Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              label("ID No. (Government Issued)"),
              textField(idNumberController),
              const SizedBox(
                height: 10.0,
              ),
              label("Nationality"),
              textField(nationalityController),
              const SizedBox(
                height: 10.0,
              ),
              label("Speaks"),
              textField(languageController),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Health Declaration",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              label("Allergy"),
              textField(allergyController),
              const SizedBox(
                height: 10.0,
              ),
              label("Pre-Exsiting Medical Condition"),
              textField(medicalConditionController),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (pickedImage != null) {
                      UserApiService().putProfilePic(context, pickedImage!);
                    }
                    // UserApiService().putProfileData(
                    //   userNameController.value.text,
                    //   selectedDesignation,
                    //   lastNameController.value.text,
                    //   givenNameController.value.text,
                    //   emailController.value.text,
                    //   selectedCountryCode,
                    //   mobileNumberController.value.text,
                    //   selectedIdType,
                    //   selectedCurrency,
                    //   idNumberController.value.text,
                    //   nationalityController.value.text,
                    //   languageController.value.text,
                    //   allergyController.value.text,
                    //   medicalConditionController.value.text,
                    // );
                  },
                  child: Container(
                    height: ScreenSize.height * 0.08,
                    width: ScreenSize.width * 0.8,
                    color: mainBlue.withOpacity(0.8),
                    child: const Center(
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
