// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record Foo {
  var i = 0
}

extend Foo {
  static mut func f() { //EXPECTED: regex modifiers 'static' and 'mut' are conflict in function declaration
    i += 1
  }
}

func main(): Int64 {
  return 1
}