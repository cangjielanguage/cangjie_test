// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args
class Hi{
  Hi(var b!: Int32 = 0){
    this.b = b
  }
}

class Data {
  Data(var a : (Hi) -> Unit) {
    this.a = a
  }
}

func run(): Bool {
  let myfunc = { a: Hi =>
    a.b = 4
  }
  let myHi = Hi(b: 5)
  
  var value : Data = Data( myfunc );

  value.a(myHi)

  return myHi.b == 4
}

func main(): Int64 {
  if (run() ){
   return 0
  };
  return 1
}

