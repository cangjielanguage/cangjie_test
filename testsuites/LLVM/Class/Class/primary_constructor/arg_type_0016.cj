// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record Hi{
  Hi(let a: Int32){
    this.a = a    // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
  }
}

class Data {
  Data(var a : Hi) {
    this.a = a
  }
}

func run(): Bool {
  var value : Data = Data( Hi(5) );
  return value.a.a == 5
}

func main(): Int64 {

  if (run()) {
   return 0
  };
  return 1
}

