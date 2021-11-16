// DEPENDENCE:  pkg cfg-ast
// EXEC: %compiler %cmp_opt -c pkg/foo.cj -o pkg.%middle && %copycharjs pkg
// EXEC: %compiler %cmp_opt %n.cj  pkg.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkg.*

class foo{
    init(){}
    var num: Int32 = 0
    init(num: Int32){
        this.num = num
    }
}

extend foo <: I{
    func compare(b: foo): foo {
        if(this.num > b.num){
            return this
        }
        return b
    }
}

func run(): Int64 {
    var a = foo(2)
    var b = foo(3)
    let x = a.compare( b)
    if (x.num == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
