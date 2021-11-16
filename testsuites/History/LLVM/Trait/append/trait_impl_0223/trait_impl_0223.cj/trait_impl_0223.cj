// DEPENDENCE: trait_impl_0223a cfg-ast
// EXEC: %compiler %cmp_opt -c trait_impl_0223a/trait_impl_0223a.cj -o trait_impl_0223a/trait_impl_0223a.o
// EXEC: %compiler %cmp_opt %n.cj -import-config  cfg-ast trait_impl_0223a/trait_impl_0223a.o -o %output
// EXEC: %run %run_opt %output %run_args


import trait_impl_0223a.Color


class Fruit  {
  var name : Int32
  init() {
    name = 0
  }
}


append Fruit with Color {
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

func run(): Int64 {
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
