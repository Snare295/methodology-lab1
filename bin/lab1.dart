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
  
  double an = double.parse(a);
  double bn = double.parse(b);
  double cn = double.parse(c);
}
