import 'dart:convert';

import 'package:template_mvvm_flutter/domain/model/test.dart';

Test testFromString(String str) => testFromJson(json.decode(str));

String testToString(Test data) => json.encode(testToJson(data));

Test testFromJson(Map<String, dynamic> json) => Test(
      test: json["test"],
    );

Map<String, dynamic> testToJson(Test test) => {
      "test": test,
    };
