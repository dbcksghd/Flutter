//비동기 함수가 반환하는 값을 처리하려면 then() 함수를 사용한다.
//than 함수 사용법

void main() async {
  await getVersionName().then((value) => {print(value)});
  print('end process');
}

Future<String> getVersionName() async {
  var versionName = await lookUpVersionName();
  return versionName;
}

String lookUpVersionName() {
  return 'start';
}

//이외에도 실행 과정에서 오류가 발생했을때 호출할 수 있는 error()함수도 있다.