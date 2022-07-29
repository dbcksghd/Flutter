import 'dart:convert';

void main() {
  var jsonString = '''
[
  {"score" : 40},
  {"score" : 80}
  ]
  ''';
  var scores = jsonDecode(jsonString);
  print(scores is List);
  var firstScore = scores[0];
  print(firstScore is Map);
  print(firstScore['score'] == 40);
}


//다음에 json 장인한테 가서 물어볼 예정