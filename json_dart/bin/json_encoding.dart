import 'dart:convert';

void main() {
  var scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];

  var jsonText = jsonEncode(scores);
  print(jsonText ==
      '[{"score":40},{"score":80},'
          '{"score":100, "overtime":true,'
          '"special_guest":null}]');
}
