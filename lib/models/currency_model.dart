class Currency {
  final int currencyId;
  final String name;
  final String code;
  final String sign;
  final String value;
  final String formatStr;
  final String unicodeHex;
  final String unicodeDecimal;
  CurrencyLinks links;

  Currency({
    required this.currencyId,
    required this.name,
    required this.code,
    required this.sign,
    required this.value,
    required this.formatStr,
    required this.unicodeHex,
    required this.unicodeDecimal,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Currency.fromJson(Map<String, dynamic> parsedJson) {
    return Currency(
      currencyId: parsedJson['id'],
      name: parsedJson['name'],
      code: parsedJson['code'],
      sign: parsedJson['sign'],
      value: parsedJson['value'],
      formatStr: parsedJson['format_str'],
      unicodeHex: parsedJson['unicode_hex'],
      unicodeDecimal: parsedJson['unicode_decimal'],
      links: CurrencyLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'id': currencyId,
      'name': name,
      'code': code,
      'sign': sign,
      'value': value,
      'format_str': formatStr,
      'unicode_hex': unicodeHex,
      'unicode_decimal': unicodeDecimal,
    };
  }
}

/////////////////// Currency Links Model ///////////////////
class CurrencyLinks {
  String selfLink;

  CurrencyLinks({
    required this.selfLink,
  });

  factory CurrencyLinks.fromJson(dynamic parsedJson) {
    return CurrencyLinks(
      selfLink: parsedJson['self'],
    );
  }
}