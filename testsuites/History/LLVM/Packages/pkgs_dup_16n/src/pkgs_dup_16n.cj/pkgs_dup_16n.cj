// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test

class Foo {
    var year: Int32 = 1
    var day: Int32 = 2
}

trait FooTrait {
    func update(a: This): This
}

append Foo with FooTrait {
    func update(a: Foo): Foo {
        var test: Int32 = 2
        a.year = a.year + test
        a.day = a.day + test
        return a
    }
}

let res = Foo().update()
let res1 = res.year
let res2 = res.day

func run(): Int64 {
    if ( res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
