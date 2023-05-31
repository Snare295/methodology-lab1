import 'dart:io';

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

}

bool isNumber(String? s){
  if (s == null){
    return false;
  }

  double? res = double.tryParse(s);
  if (res == null){
    return false;
  }
  
  return true;
}
