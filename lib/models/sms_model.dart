
class SMSModel {

  final String? sms;
  final String? phoneNumber;
  final String? timeData;

  const SMSModel({

    required this.sms,
    required this.phoneNumber,
    required this.timeData
  });

  toJson() {

    return {
      "sms" : sms,
      "PhoneNumber": phoneNumber,
      "TimeData": timeData
    };
  }
}
