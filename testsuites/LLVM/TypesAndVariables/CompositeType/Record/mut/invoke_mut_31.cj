// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

interface I{
  mut func f(): Unit
}

record Foo <: I {
  var v = 0
  mut func f(): Unit{
    v += 1
  }
}

func main(){
  var a = Foo()
  var b : I = a
  b.f()
  return a.v
}