void main() {
  printOne();
  printTwo();
  printThree();
}

void printOne() {
  print('One');
}

void printTwo() async {
  await Future.delayed(Duration(seconds: 1), () {
    //Duration만큼 뒤(1초)에 실행해라
    print('end process');
  });
  print('Two');
}

void printThree() {
  print('Three');
}

/*Future.delayed 앞에 await이 붙었으므로 이후 코드 진행을 멈추고, main 함수로 돌아가
printThree를 먼저 실행한 후 1초 뒤 end process와 Two를 출력한다. 

이처럼 await를 이용하면 await이 속한 함수를 호출한쪽의 프로세스가 끝날때까지 기다리는것을 알 수 있다.
*/