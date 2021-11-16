// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
  Data(var a : Range<Int64>) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data( 0..10:2 );
  var sum: Int64 = 0
  for( i in value.a){
    sum += i
  }
  return sum == 20
}

func main(): Int64 {

  if( run() ){
   return 0
  };
  return 1
}

