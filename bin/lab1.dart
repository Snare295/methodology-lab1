import 'dart:developer';
import 'dart:io';
import 'dart:math';

main() {
  double a, b, c;
  int? progMode;
  bool? bExceptionCaught;

  //Reading user input of program mode
  stdout.write("Select program mode 1 or 2\n");
  stdout.write("1: Interactive mode, require input of a,b,c\n");
  stdout.write("2: File mode, read from file (for more help readme.md)\n");
  do {
    String? inp = stdin.readLineSync();
    if (inp != null) {
      progMode = int.tryParse(inp);
    }
    if (progMode == 1 || progMode == 2) {
      break;
    }
    stdout.write("Wrong input, select 1 or 2\n");
  } while (true);

  //switch for program mode
  if (progMode == 1) {
    (a, b, c) = progModeInteractive();
  } else if (progMode == 2) {
    (a, b, c, bExceptionCaught) = progModeFile();
  } else {
    throw "Unexpected behaviour: progMode isn't 1 or 2";
  }

  //Handling exception
  if (bExceptionCaught == true) {
    stdout.write("Error. Invalid text file formating, check README.md");
    stdin.readLineSync();
    return 1;
  }

  //Calculating and writing in terminal
  double? x1, x2;
  (x1, x2) = calculateSquareEq(a, b, c);

  //Output equation
  stdout.write("Equation is: ($a) x^2 + ($b) x + ($c) = 0\n");

  //Output roots
  if (x2 != null) {
    stdout.write("There are 2 roots\n");
    stdout.write("x1 = $x1\n");
    stdout.write("x2 = $x2\n");
  } else if (x1 != null) {
    stdout.write("There are 1 roots\n");
    stdout.write("x1 = $x1\n");
  } else {
    stdout.write("There are 0 roots\n");
  }

  //Pause after complition
  stdin.readLineSync();
}

bool isNumber(String? s) {
  if (s == null || s == "NaN") {
    return false;
  }

  double? res = double.tryParse(s);
  if (res == null) {
    return false;
  }

  return true;
}

(double?, double?) calculateSquareEq(double a, b, c) {
  double? x1, x2;
  double discr;

  discr = pow(b, 2) - (4 * a * c);

  if (discr >= 0) {
    x1 = (-b + sqrt(discr)) / (2 * a);
  }
  if (discr > 0) {
    x2 = (-b - sqrt(discr)) / (2 * a);
  }

  return (x1, x2);
}

(double, double, double) progModeInteractive() {
  double? a, b, c;
  String? inp;
  bool? ver;

  //Input for var a
  do {
    ver = false;
    stdout.write("Write value for a:");
    inp = stdin.readLineSync();

    if (isNumber(inp) && inp != null) {
      ver = true;
      a = double.parse(inp);
    } else {
      stdout.write("Error. Expected a valid real number, got $inp instead \n");
    }
  } while (!ver);

  //Input for var b
  do {
    ver = false;
    stdout.write("Write value for b:");
    inp = stdin.readLineSync();

    if (isNumber(inp) && inp != null) {
      ver = true;
      b = double.parse(inp);
    } else {
      stdout.write("Error. Expected a valid real number, got $inp instead \n");
    }
  } while (!ver);

  //Input for var c
  do {
    ver = false;
    stdout.write("Write value for c:");
    inp = stdin.readLineSync();

    if (isNumber(inp) && inp != null) {
      ver = true;
      c = double.parse(inp);
    } else {
      stdout.write("Error. Expected a valid real number, got $inp instead \n");
    }
  } while (!ver);

  return (a!, b!, c!);
}

(double, double, double, bool) progModeFile() {
  double? a, b, c;
  String? inp;
  List<int> content;

  //Reading path of file
  do {
    stdout.write("Write path of file: ");
    inp = stdin.readLineSync();

    if (inp == null && inp == "") {
      stdout.write("Error. Empty input\n");
    } else if (File(inp!).existsSync() == false) {
      stdout.write("Error. Invalid path\n");
    } else if (RegExp(".txt\$").hasMatch(inp) == false) {
      stdout.write("Error. Invalid file extension, need *.txt");
    } else {
      break;
    }
  } while (true);

  content = File(inp).readAsBytesSync();
  if (content.isEmpty) {
    return (0, 0, 0, true);
  }

  int first = content.indexOf(32);
  if (first == -1) {
    return (0, 0, 0, true);
  }
  a = double.tryParse(String.fromCharCodes(content.take(first).toList()));
  if (a == null) {
    return (0, 0, 0, true);
  } else {
    stdout.writeln("a is $a");
  }

  int second = content.indexOf(32, first + 1);
  if (second == -1) {
    return (0, 0, 0, true);
  }
  b = double.tryParse(
      String.fromCharCodes(content.getRange(first, second).toList()));
  if (b == null) {
    return (0, 0, 0, true);
  } else {
    stdout.writeln("b is $b");
  }

  int third = content.lastIndexOf(10);
  if (third != content.indexOf(10)) {
    stdout.writeln(
        "Found multiple LF, likely you using linux, remove new line at end of file");
    return (0, 0, 0, true);
  }
  if (third == -1) {
    stdout.writeln(
        "LF not found in file, likely you using windows because it doesn't place LF at end of file. Continue as you have LF");
    third = content.length;
  }
  if (content.indexOf(32, second + 1) != -1) {
    return (0, 0, 0, true);
  }
  c = double.tryParse(
      String.fromCharCodes(content.getRange(second, third).toList()));
  if (c == null) {
    return (0, 0, 0, true);
  } else {
    stdout.writeln("c is $c");
  }

  return (a, b, c, false);
}
