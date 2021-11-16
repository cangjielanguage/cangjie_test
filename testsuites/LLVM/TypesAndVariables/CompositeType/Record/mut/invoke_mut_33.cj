// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

interface I{
  mut func f(): Int64
}

interface I1 <: I{
  mut func f(): Int64{
    1
  }
}

interface I2<: I1{
  mut func f(): Int64{
    2
  }
}

interface I3<: I2{
  mut func f(): Int64{
    3
  }
}

record Foo <: I3 & I {
  var v = 0
  mut func f(): Int64{
    3
  }

  mut func ff(): Unit{
    v += f()
  }
}

func main(){
  var a = Foo()
  a.ff()
  return a.v - 3
}