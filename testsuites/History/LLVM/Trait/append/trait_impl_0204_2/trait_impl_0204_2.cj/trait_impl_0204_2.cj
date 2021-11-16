// DEPENDENCE:  pkg cfg-ast
// EXEC: %compiler %cmp_opt -c pkg/foo.cj -o pkg/foo.o
// EXEC: %compiler %cmp_opt %n.cj -import-config  cfg-ast pkg/foo.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkg.foo

trait Big {
    func compare(a: This, b: This): This
}

append foo with Big {
    func compare(a: foo, b: foo): foo {
        if(a.num > b.num){
            return a
        }
        return b
    }
}

func run(): Int64 {
    var a = foo(2)
    var b = foo(3)
    let x = compare(a , b)
    if (x.num == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
