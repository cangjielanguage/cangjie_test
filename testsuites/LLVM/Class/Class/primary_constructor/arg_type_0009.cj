// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : List<Int64>) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data( [1, 2, 3] );
  return (value.a[0] == 1) && (value.a[1] == 2) &&( value.a[2] == 3)
}

func main(): Int64 {

  if (run() ){
   return 0
  };
  return 1
}

