// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Num {
    func self(a: Int32,b:This): Int32
}

trait Color {
    func addcolor(a: This): This
}

class Fruit  {
  var name : Int32
  init() {
    name = 0
  }
}


append Fruit with Num, Color {
    func self(a:Int32 , b:Fruit): Int32 { a + 0 }
    func addcolor(a: Fruit): Fruit {
    if (a.name == 1) {
        a.name = 51
    }
    if (a.name == 2) {
        a.name = 72
    }
    return a
    }
}

func run(): Int64{
    let x: Fruit = Fruit()
    x.name = 1
    let y: Fruit = addcolor(x)
    if (y.name  == 51) {
       return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

