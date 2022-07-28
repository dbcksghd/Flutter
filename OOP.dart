/*void main(){
  Idol blackPink = new Idol();

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();
}
// idol class
// name(이름) - 변수
// members (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수
class Idol{
  String name = '블랙핑크';
  List<String> members = ['지수', '제니', '리사', '로제'];

  void sayHello(){
    print("안녕하세요 저희는 블랙핑크입니다.");
  }
  void introduce(){
    print("저희 멤버는 지수, 제니, 리사, 로제가 있습니다.");
  }


}*/ //지금 저 Idol 클래스로는 블랙핑크밖에 생성할수 없다

void main(){
  Idol blackPink = new Idol(
    '블랙핑크',
    ['지수', '제니', '리사', '로제']
  );

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();
  // Idol bts = Idol(
  //   'BTS',
  //   ['RM', '진', '슈가', '제이홉', '지민', '뷔', '정국']
  // );
  Idol bts = Idol.fromList( //fromList로 받기 위해 이렇게 바꿈
    [
      ['RM', '진', '슈가', '제이홉', '지민', '뷔', '정국'],
      'BTS'
    ]
  );
  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();
}
// idol class
// name(이름) - 변수
// members (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수
// constructor (생성자)
class Idol{
  String name; //= '블랙핑크';
  List<String> members; //= ['지수', '제니', '리사', '로제'];

  /*Idol(String name, List<String> members):
  this.name = name,
  this.members = members;*/ //더 간단하게 만드는 법
  Idol(this.name, this.members);

  Idol.fromList(List values) //fromList라는 리스트에 멤버들을 인덱스 0번, 그룹이름을 인덱스
    :this.members = values[0], //1번에 저장한다
     this.name = values[1];

  /*void sayHello(){
    print("안녕하세요 저희는 블랙핑크입니다.");//sayHello 함수를 호출해도 블핑밖에 안나옴
  }
  void introduce(){
    print("저희 멤버는 지수, 제니, 리사, 로제가 있습니다.");
  }*/
  void sayHello(){
    print('안녕하세요 ${this.name}입니다.');
  }
  void introduce(){
    print('저희 멤버는 ${this.members}가 있습니다.');
  }


}