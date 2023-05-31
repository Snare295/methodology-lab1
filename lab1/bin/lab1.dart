import 'package:lab1/lab1.dart' as lab1;
import 'dart:io';
import 'dart:convert';

main(){
  stdout.write("Write value for a:");
  String? a = stdin.readLineSync();
  if (a == "") {
    print("You given an empty value, abort program");
    return;
  }

  stdout.write("Write value for b:");
  String? b = stdin.readLineSync();
  if (b == "") {
    print("You given an empty value, abort program");
    return;
  }

  stdout.write("Write value for c:");
  String? c = stdin.readLineSync();
  if (c == "") {
    print("You given an empty value, abort program");
    return;
  }
}
