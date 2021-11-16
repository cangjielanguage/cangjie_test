// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 
open class Base {
  Base(var a!: Int32 = 1, var b!: Int32 = 2) {
    this.a = a
    this.b = b
  }
}

class Data <: Base{
  Data(var aa!: Int32 = 1, var bb!: Int32 = 2) {
    this.a = aa
    this.b = bb
  }
}

func run(): Int64 {
  var value : Base = Base(a: 3, b: 4);
  var value2 : Data = Data(aa: 5, bb: 6);
  if ((value.a == 3) &&  (value.b == 4) ){
    let value : Base = Base()
    if ((value.a == 1) &&  (value.b == 2) ){
      return 0
    }else {
      return 1
    }
  }
  else {
    return 1
  }
}

func main(): Int64 {
  return run()
}

