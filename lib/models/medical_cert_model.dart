class MedicalCert {
  final int medicalCertId;
  final int customerId;
  final String customerFullName;
  final int customerNationalId;
  final int providerId;
  final String providerDesignation;
  final String providerFullName;
  final String consultationId;
  final String numOfUnfitDays;
  final String description;
  final bool isUnfit;
  final bool isLightDuty;
  final String startTime;
  final String endTime;
  final String createdOn;
  MedicalCertLinks links;

  MedicalCert({
    required this.medicalCertId,
    required this.customerId,
    required this.customerFullName,
    required this.customerNationalId,
    required this.providerId,
    required this.providerDesignation,
    required this.providerFullName,
    required this.consultationId,
    required this.numOfUnfitDays,
    required this.description,
    required this.isUnfit,
    required this.isLightDuty,
    required this.startTime,
    required this.endTime,
    required this.createdOn,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory MedicalCert.fromJson(Map<String, dynamic> parsedJson) {
    return MedicalCert(
      medicalCertId: parsedJson['id'],
      customerId: parsedJson['customer_id'],
      customerFullName: parsedJson['customer_full_name'],
      customerNationalId: parsedJson['customer_national_id'],
      providerId: parsedJson['provider_id'],
      providerDesignation: parsedJson['provider_designation'],
      providerFullName: parsedJson['provider_full_name'],
      consultationId: parsedJson['consultation_id'],
      numOfUnfitDays: parsedJson['num_of_unfit_days'],
      description: parsedJson['description'],
      isUnfit: parsedJson['is_unfit'],
      isLightDuty: parsedJson['is_light_duty'],
      startTime: parsedJson['start_time'],
      endTime: parsedJson['end_time'],
      createdOn: parsedJson['created_on'],
      links: MedicalCertLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'id': medicalCertId,
      'customer_id': customerId,
      'customer_full_name': customerFullName,
      'customer_national_id': customerNationalId,
      'provider_id': providerId,
      'provider_designation': providerDesignation,
      'provider_full_name': providerFullName,
      'consultation_id': consultationId,
      'num_of_unfit_days': numOfUnfitDays,
      'description': description,
      'is_unfit': isUnfit,
      'is_light_duty': isLightDuty,
      'start_time': startTime,
      'end_time': endTime,
      'created_on': createdOn,
    };
  }
}

/////////////////// MedicalCert Links Model ///////////////////
class MedicalCertLinks {
  String selfLink;

  MedicalCertLinks({
    required this.selfLink,
  });

  factory MedicalCertLinks.fromJson(dynamic parsedJson) {
    return MedicalCertLinks(
      selfLink: parsedJson['self'],
    );
  }
}