
package test

from ast import ast.*

external macro M(a:Tokens){
    return quote(// exec: %compiler %cmp_opt %n.cj -o %output
// exec: %run %run_opt %output %run_args

record Test {
    let range1 = 0..10
    let range2: Range<Int32> = 0..10
}

let range1 = Test().range1

func run(): Int64 {
    var res: Int32 = 0
    for (i in range1) {
       res = res + 1
    }
    if (res == 10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
)
}
