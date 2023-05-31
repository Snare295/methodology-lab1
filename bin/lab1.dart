import 'dart:io';
import 'dart:math';

main(){
  bool? ver;
  String? inp;
  double? a,b,c;

  //Input for var a
  do{
    ver = false;
    stdout.write("Write value for a:");
    inp = stdin.readLineSync();

    if (isNumber(inp) && inp != null) {
      ver = true ;
      a = double.parse(inp);
    }
    else {
      stdout.write("Error. Expected a valid real number, got $inp instead \n");
    }
  } while (!ver);

  //Input for var b
  do{
    ver = false;
    stdout.write("Write value for b:");
    inp = stdin.readLineSync();

    if (isNumber(inp) && inp != null) {
      ver = true ;
      b = double.parse(inp);
    }
    else {
      stdout.write("Error. Expected a valid real number, got $inp instead \n");
    }
  } while (!ver);

  //Input for var c
  do{
    ver = false;
    stdout.write("Write value for c:");
    inp = stdin.readLineSync();

    if (isNumber(inp) && inp != null) {
      ver = true ;
      c = double.parse(inp);
    }
    else {
      stdout.write("Error. Expected a valid real number, got $inp instead \n");
    }
  } while (!ver);
  
  //calculating and writing in terminal
  double? x1,x2;
  (x1, x2) = calculateSquareEq(a!, b!, c!);
  
  //output equation
  stdout.write("Equation is: ($a) x^2 + ($b) x + ($c) = 0\n");

  //output roots
  if(x2 != null){
    stdout.write("There are 2 roots\n");
    stdout.write("x1 = $x1\n");
    stdout.write("x2 = $x2\n");
  } else
  if(x1 != null){
    stdout.write("There are 1 roots\n");
    stdout.write("x1 = $x1\n");
  } else {
    stdout.write("There are 0 roots\n");
  }
  
}

bool isNumber(String? s){
  if (s == null || s == "NaN"){
    return false;
  }

  double? res = double.tryParse(s);
  if (res == null){
    return false;
  }
  
  return true;
}

(double?, double?) calculateSquareEq(double a, double b, double c){
  double? x1, x2;
  double discr;

  discr = pow(b,2) - (4*a*c);
  print(discr); 
  if(discr >= 0){
    x1 = (-b + sqrt(discr)) / (2*a);
  }
  if(discr > 0) {
    x2 = (-b - sqrt(discr)) / (2*a);
  }
  print(x1);
  print(x2);
  return (x1, x2);
} 
