void main() {
  /*//변수 선언
  var name = "유찬홍";

  print(name);

  var name2 = "대마고";

  print(name2);

  //변수 값 바꾸기
  name = "플러터";

  print(name);

  //정수 integer

  int num1 = 10;
  print(num1);

  int num2 = 20;
  print(num1 + num2);
  print(num1 - num2);
  print(num1 / num2);
  print(num1 * num2);

  //실수 double

  double num3 = 2.5;
  double num4 = 0.5;
  print(num3 + num4);
  print(num3 - num4);
  print(num3 / num4);
  print(num3 * num4);

  //맞다/틀리다 boolean
  bool isTrue = true;
  bool isFalse = false;

  print(isTrue);
  print(isFalse);

  //글자 타입 String
  String a = "이정호";
  String b = "김연우";

  print(a);
  print(b);
  print(a + ' ' + b); //이정호 김연우 출력
  print('${a} ${b}'); //이정호 김연우 출력

  //var 타입추론
  var c = '조병진';
  var d = 20;
  print(c.runtimeType); //c가 무슨 타입인지
  print(d);
  //한번 선언하면 다른 타입으로 변경 불가능

  //다이나믹=ㄹㅇ 다됨
  dynamic e = '김성원';
  print(e);
  dynamic f = 10;
  print(f);
  //한번 선언해도 다른 타입으로 변경 가능 ex) 원래 정수형인데 문자형으로 바꾸기

  //상수 설정
  final String g = '김철우'; //final과 const로 수정할수 없게 지정할수 있다
  print(g);
  final h = 32; //물론 var같이 형식을 생략할수 있다
  print(h);

  final DateTime now = DateTime.now();
  print(now);
  //const DateTime now2 = DateTime.now(); const는 빌드 시간을 알고 있어야 함
  //print(now2); DateTime은 final로 할것!!


  int number = 2;
  print(number);
  print(number+2);
  print(number-2);
  print(number*2);
  print(number/2);
  print('----------------');
  print(number%2);
  print(number%3); // 3/2는 나머지가 2임
  print(number); //별짓 다해도 얘는 아직 2임
  print('--------------');
  number ++; //후치증가
  print(number);//얘는 3임
  number--;//후치감소
  print(number);//얘는 2임
  
  double num1 = 4.0;
  print(num1);
  num1 += 1;
  print(num1);
  num1-=1;
  print(num1);
  num1 *=2;
  print(num1);
  num1 /=2;
  print(num1);
  
  double? num2 = 4.0; //double과 null 둘다 들어갈수 있음
  print(num2);
  num2 = 2.0;
  print(num2);
  num2 = null;
  print(num2);
  num2??=3.0; //num2가 null값이면 3.0으로 값을 바꿈
  print(num2);

  int num3 = 1;
  int num4 = 2;
  print(num3 > num4);
  print(num3 < num4);
  print(num3 >= num4);
  print(num3 <= num4);
  print(num3 == num4);
  print(num3 != num4); //참이면 true를 출력하고 거짓이면 false를 출력함
  
  int num5 = 1;
  print(num5 is int); //num5가 int형이면 true 출력
  print(num5 is String); //num5가 문자형이면 true를, 아니면 false를 출력
  print(num5 is! int); //num5가 int형이면 false를, 아니면 true를 출력
  print(num5 is! String);
  
  bool result = 12>10; //조건을 여러개로 하고싶다면 &&를 쓰기
  result = 12>10 && 1>0; // 두 조건을 다 성립해야 true를 출력
  print(result);
  bool result2 = 12>10 && 0>1;
  print(result2);
  bool retult3 = 12>10 || 1>0; //두 조건중 하나만 참이여도 true를 출력함
  print(retult3);
  
  //리스트
  List<String> JamPot = ['용수', '근우', '승재', '승훈']; //문자열 타입에 숫자가 들어가면 오류남
  List<int> numbers = [1, 2, 3, 4, 5];
  
  print(JamPot);
  print(numbers);

  //index, 순서 , 모든 index는 0부터 시작
  print(JamPot[0]);//0번째 인덱스에 있는 용수를 가져옴
  print(JamPot[1]); //1번째 인덱스에 있는 근우를 가져옴
  print(JamPot.length); //리스트의 길이를 출력 4개라서 4
  JamPot.add('지관'); //잠팟 리스트에 지관이를 추가
  print(JamPot);
  JamPot.remove('지관'); //잠팟 리스트에서 지관이를 삭제
  print(JamPot);
  print(JamPot.indexOf('승재')); //승재가 몇번째 인덱스에 있는지 출력
  
  //Map  key/value값이 있음
  Map<String, String> Gwangjuin = {
    'Kang in hye' : '강인혜',
    'Gwan ha eun' : '권하은',
    'Yoo chan hong' : '유찬홍',
  };
  print(Gwangjuin);

  Map<String, bool> Dormitory507 = {
    '양운석' : true,
    '유현담' : true,
    '오성환' : false,
  };
  print(Dormitory507);

  Dormitory507.addAll({ //추가하는법
    '마재영' : false,
  });
  print(Dormitory507);

  print(Dormitory507['오성환']); //key에 맞는 value 값을 출력해줌

  Dormitory507['김현민'] = false; //추가하는법
  print(Dormitory507);
  Dormitory507['유찬홍'] = true;
  print(Dormitory507);

  Dormitory507.remove('김현민'); //삭제하는법
  print(Dormitory507);
  Dormitory507.remove('오성환');
  Dormitory507.remove('마재영');
  print(Dormitory507);

  print(Dormitory507.keys); //keys값만 출력
  print(Dormitory507.values); //value값만 출력
  
  // Set
  //List는 중복이 들어갈수 있지만 Set는 중복이 들어갈 수 없음
  final Set<String> names = {
    '김지훈',
    '김상구',
    '이원성',
    '김지훈', //자동으로 지훈이를 걸러서 중복을 없애줌
  };
  print(names);

  names.add('장지성'); //추가하는법
  print(names);

  names.remove('이원성'); //삭제하는법
  print(names);

  print(names.contains('김지훈')); //지훈이가 names Set 안에 존재하면 true 출력
  print(names.contains('김세현')); //세현이가 없으니까 false 출력
  
  // if문
  int num = 8;

  if(num % 3 == 0){
    print('나머지가 0');
  }
  else if(num %3 == 1){
    print('나머지가 1');
  }
  else {
    print('나머지가 2');
  }
  
  //switch문

  int num = 3;

  switch(num % 3){
    case 0:
    print('나머지가 0');
    break;
    case 1:
    print('나머지가 1');
    break;
    case 2:
    print('나머지가 2');
    break;
  }
  */
  //for loop
  for(int i = 0; i < 10; i++)
  {
    print(i);
  }

  int total = 0;
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  for (int i = 0; i<numbers.length; i++) //numbers.length = numbers 배열의 길이
  {
    total +=numbers[i];
  }
  print(total);

  total = 0;
  for (int number in numbers){ //in의 오른쪽에 있는 list 값을 loop을 돌면서
    total += number;             //하나씩 왼쪽의 변수에 넣어줌
  }
  print(total);
}
