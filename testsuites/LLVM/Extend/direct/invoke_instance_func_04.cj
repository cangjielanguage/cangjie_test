// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
record Foo {
  var i = 0
}
extend Foo {
// TODO: mut not supported
  mut func f() {
    i += 1
  }
}

func main(): Int64 {
  var a = Foo()
  a.f()
  return a.i - 1
}
