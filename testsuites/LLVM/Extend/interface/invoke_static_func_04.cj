// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

extend Foo <: I{
  static mut func f() { //EXPECTED: regex modifiers 'static' and 'mut' are conflict in function declaration
    i += 1
  }
}

func main(): Int64 {
  return 1
}

interface I{
  static func foo(){
    1
  }
}

record Foo {
  var i = 0
}
