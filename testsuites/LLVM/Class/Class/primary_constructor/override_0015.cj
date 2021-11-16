// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data<D, C> {
  var a: Int32 = 1
  var b: Int32 = 2
  Data(a: C, b: Int32, c !: Int32 = 0) {
    this.a = a 
    this.b = a
  }

  init(a: C, b: Int32, c!: Bool = false){

  }
}

func run(): Int64 {
  var a: Int32 = 8
  let b: Bool = false
return Int64(Data<Int32, Int32>(a,a).a - 8) // EXPECTED: regex ambiguous match for constructor call 'Data'
}

func main(): Int64 {
  return run()
}

