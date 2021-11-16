// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

interface I{
  mut func f(): Unit
}

record Foo <: I {
  var v = 0
  mut func f(): Unit{
    v += 1
  }

  operator func == (b: Foo){
    return this.v == b.v
  }
}

func main(){
  var a = Foo()
  let aa = Foo()
  match (a) {
    case c@ $aa => c.f() //EXPECTED: regex let instance of record 'c' cannot access the mutable function 'f'
    case _ => a.f()
  }
  
  return a.v - 5
}