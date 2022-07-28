void main() {
  printOne();
  printTwo();
  printThree();
}

void printOne() {
  print('One');
}

void printTwo() async {
  Future.delayed(Duration(seconds: 1), () {
    //Duration만큼 뒤(1초)에 실행해라
    print('end process');
  });
  print('Two');
}

void printThree() {
  print('Three');
}

/*One 출력 이후 비동기 함수 printTwo에 진입하면 end process를 1초 지연했으므로
Two가 먼저 출력된다. 그 후 Three가 출력되고 1초가 다 지난 시간에 end process가 출력된다.*/

//만약 Future.delayed 앞에 await를 붙이면 어떻게 될까? --> await1