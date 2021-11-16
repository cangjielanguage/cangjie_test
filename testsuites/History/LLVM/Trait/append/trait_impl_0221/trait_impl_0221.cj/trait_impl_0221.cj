// DEPENDENCE: trait_impl_0221a cfg-ast
// EXEC: %compiler %cmp_opt -c trait_impl_0221a/trait_impl_0221a.cj -o trait_impl_0221a/trait_impl_0221a.o
// EXEC: %compiler %cmp_opt %n.cj -import-config  cfg-ast trait_impl_0221a/trait_impl_0221a.o -o %output
// EXEC: %run %run_opt %output %run_args

import trait_impl_0221a.Num

record A {
    var x: Int64 = 2
}
append A with Num {
    func self(a: A): A { A() }
}

func run(): Int64 {
    let x: A  = self(A())
    if (x.x == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
