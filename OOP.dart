void main(){
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


}