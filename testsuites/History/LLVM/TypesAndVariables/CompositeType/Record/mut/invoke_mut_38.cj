// EXEC: %compiler %cmp_opt -c %n.cj

interface I{
  mut func f(): Unit
}

record Foo <: I {
  var v = 0
  mut func f(): Unit{
    v += 1
  }

  mut func f1(): Unit{
    v += 2
  }

  operator func == (b: Foo){
    return this.v == b.v
  }
}

func main(){
  var a = [Foo()]
  let aa = Foo()
  match (a) {
    case [$aa] => a[0].f1()
    case _ => a[0].f()
  }
  
  return a[0].v
}