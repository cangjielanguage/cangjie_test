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

  mut func f(a: Int64): Unit{
    v += a
  }

  mut func f(a: Int64, b: Int64): Unit{
    v = v + a + b
  }
}

func main(){
  var a = Foo()
  a.f()
  a.f(1)
  a.f(1, 2)
  return a.v - 5
}