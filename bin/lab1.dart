import 'dart:io';

main(){
  stdout.write("Write value for a:");
  String? a = stdin.readLineSync();
  if (a == "" || a == null) {
    print("You given an empty value, abort program");
    return;
  }

  stdout.write("Write value for b:");
  String? b = stdin.readLineSync();
  if (b == "" || b == null ) {
    print("You given an empty value, abort program");
    return;
  }

  stdout.write("Write value for c:");
  String? c = stdin.readLineSync();
  if (c == "" || c == null ) {
    print("You given an empty value, abort program");
    return;
  }
  
  int an = int.parse(a);
  int bn = int.parse(b);
  int cn = int.parse(b);
}
