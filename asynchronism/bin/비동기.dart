void main() {
  checkVersion();
  print('end process');
}

Future checkVersion() async {
  var version = await lookUpVersion();
  print(version);
}

int lookUpVersion() {
  return 12;
}

/*비동기란? 언제 끝날지 모르는 작업을 기다리지 않고 다음 작업을 처리하게 하는 것

 예시로 저 코드에서는 checkVersion 함수를 호출 후 기다리지 않고 바로 end process를 출력하는것을
볼수 있다.

async와 await 키워드로 비동기를 구현할 수 있다.
1. 함수 이름 뒤, 본문이 시작하는 중괄호 { 앞에 async 키워드를 붙여서 비동기로 만든다.
2. 비동기 함수 안에서 언제 끝날지 모르는 작업 앞에 await 키워드를 붙인다.
3. 2번 작업을 마친 결과를 받기 위해 비동기 함수 이름 앞에 Future 클래스를 지정한다.
(만약 값이 여러개면 Stream을 붙인다.)

이렇게 비동기 처리를 이용하면 지연이 발생하는 동안 멈춰있지 않고 다른 동작을 하게 할 수 있다.*/