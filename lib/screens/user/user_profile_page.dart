import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/user_model.dart';
import '../../services/user_api_service.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/themes.dart';
import 'components/label_widget.dart';
import 'components/text_field_widget.dart';
import '../home/home_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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

  late User user;
  late String selectedDesignation;
  late String selectedCountryCode;
  late String selectedIdType;
  late String selectedCurrency;
  late final String _userSelfieUrl;

  List<String> designationChoice = [
    'Select Designation',
    'Mr',
    'Mrs',
    'Ms',
    'Mdm',
    'Dr',
    'Prof',
  ];

  List<String> identityChoice = [
    'Select Identity',
    'NRIC',
    'e-KTP',
    'Passport',
  ];

  List<String> countryCodeChoice = [
    'Select Country Code',
    '+65',
    '+60',
    '+62',
  ];

  List<String> currencyNameChoice = [
    'Select Currency',
    'Singapore Dollar',
    'Malaysia Ringgit',
  ];

  @override
  void initState() {
    User user = Provider.of<User>(context, listen: false);
    _userSelfieUrl = ApiUrl.userSelfieLink + user.selfieFile;
    debugPrint('home_screen selfieFileName: $_userSelfieUrl \n\n');

    /*
    // Fetch list of currencyName for user profile
    final List<Currency> currencies = Provider.of<List<Currency>>(context, listen: false);
    currencyNameList() {
      return currencies.map((currency) => currency.name).toList();
    }
    List<String> currencyNameChoice = currencyNameList();
     */

    // ????????????????????????????????????????????????????????
    // Bug in ternary expression causing new data to be ignored!
    user.designation.isNotEmpty
        ? selectedDesignation = user.designation
        : selectedDesignation = designationChoice[0];
    user.idType.isNotEmpty
        ? selectedIdType = user.idType
        : selectedIdType = identityChoice[0];
    user.currencyName.isNotEmpty
        ? selectedCurrency = user.currencyName
        : selectedCurrency = currencyNameChoice[0];
    user.countryCode.isNotEmpty
        ? selectedCountryCode = user.countryCode
        : selectedCountryCode = countryCodeChoice[0];
    user.userName.isNotEmpty
        ? userNameController = TextEditingController(text: user.userName)
        : userNameController = TextEditingController(text: '');
    user.lastName.isNotEmpty
        ? lastNameController = TextEditingController(text: user.lastName)
        : lastNameController = TextEditingController(text: '');
    user.givenName.isNotEmpty
        ? givenNameController = TextEditingController(text: user.givenName)
        : givenNameController = TextEditingController(text: '');
    user.email.isNotEmpty
        ? emailController = TextEditingController(text: user.email)
        : emailController = TextEditingController(text: '');
    user.phoneNum.isNotEmpty
        ? mobileNumberController = TextEditingController(text: user.phoneNum)
        : mobileNumberController = TextEditingController(text: '');
    user.idReg.isNotEmpty
        ? idNumberController = TextEditingController(text: user.idReg)
        : idNumberController = TextEditingController(text: '');
    user.nationality.isNotEmpty
        ? nationalityController = TextEditingController(text: user.nationality)
        : nationalityController = TextEditingController(text: '');
    user.languages.isNotEmpty
        ? languageController = TextEditingController(text: user.languages)
        : languageController = TextEditingController(text: '');
    user.allergies.isNotEmpty
        ? allergyController = TextEditingController(text: user.allergies)
        : allergyController = TextEditingController(text: '');
    user.preExisting.isNotEmpty
        ? medicalConditionController = TextEditingController(text: user.preExisting)
        : medicalConditionController = TextEditingController(text: '');
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>
                const HomePage()), (Route<dynamic> route) => false);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
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
                            _userSelfieUrl),
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Change Password',
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
              labelWidget('Username'),
              textFieldWidget(userNameController),
              const SizedBox(
                height: 10.0,
              ),

              ////////////// designation dropdownSelectorWidget //////////////
              labelWidget('Designation'),
              DropdownButton<String>(
                value: selectedDesignation,
                items: designationChoice
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDesignation = newValue!;
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
                  fontSize: 20,
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

              ///////////////////////// lastName /////////////////////////
              labelWidget('Last Name'),
              textFieldWidget(lastNameController),
              const SizedBox(
                height: 10.0,
              ),
              labelWidget('Given Name'),
              textFieldWidget(givenNameController),
              const SizedBox(
                height: 10.0,
              ),
              labelWidget('Email'),
              textFieldWidget(emailController),
              const SizedBox(
                height: 10.0,
              ),

              Row(
                children: [
                  //////////// countryCode dropdownSelectorWidget ////////////
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelWidget('Country Code'),
                      SizedBox(
                        width: ScreenSize.width * 0.4,
                        child: DropdownButton<String>(
                          value: selectedCountryCode,
                          items: countryCodeChoice
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCountryCode = newValue!;
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
                            fontSize: 20,
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

                  ///////////////////////// phoneNum /////////////////////////
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelWidget('Mobile Number'),
                      SizedBox(
                        width: ScreenSize.width * 0.45,
                        child: textFieldWidget(mobileNumberController),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),

              ///////////////// idType dropdownSelectorWidget /////////////////
              labelWidget('Government Issued ID Type'),
              DropdownButton<String>(
                value: selectedIdType,
                items: identityChoice
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedIdType = newValue!;
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
                  fontSize: 20,
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

              ////////////// currencyName dropdownSelectorWidget //////////////
              labelWidget('Preferred Currency'),
              DropdownButton<String>(
                value: selectedCurrency,
                items: currencyNameChoice
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
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
                  fontSize: 20,
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

              //////////////////////////// idNum ////////////////////////////
              labelWidget('ID No. (Government Issued)'),
              textFieldWidget(idNumberController),
              const SizedBox(
                height: 10.0,
              ),
              labelWidget('Nationality'),
              textFieldWidget(nationalityController),
              const SizedBox(
                height: 10.0,
              ),

              ///////////////////////// languages /////////////////////////
              labelWidget('Spoken Languages'),
              textFieldWidget(languageController),
              const SizedBox(
                height: 15.0,
              ),

              /////////////////////// healthDeclaration ///////////////////////
              const Text(
                'Health Declaration',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              labelWidget('Allergy'),
              textFieldWidget(allergyController),
              const SizedBox(
                height: 10.0,
              ),
              labelWidget('Pre-Existing Medical Condition'),
              textFieldWidget(medicalConditionController),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    debugPrint('User PUT request user.lastName: ${lastNameController.value.text}');
                    debugPrint('User PUT request user.currencyName: $selectedCurrency');
                    if (pickedImage != null) {
                      UserApiService().putProfilePic(context, pickedImage!);
                    }
                    UserApiService().updateUserProfile(context);
                  },
                  child: Container(
                    height: ScreenSize.height * 0.08,
                    width: ScreenSize.width * 0.8,
                    color: mainBlue.withOpacity(0.8),
                    child: const Center(
                      child: Text(
                        'SUBMIT',
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