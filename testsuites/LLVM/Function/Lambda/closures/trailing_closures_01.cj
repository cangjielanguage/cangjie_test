// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a1 = foo1(1, { i => i * 2 })
    if ( a1 != 2 ) {
        return 1
    }
    var a2 = foo1(1) { i => i * 2 }
    if ( a2 != 2 ) {
        return 1
    }
    var a3 = foo2{ i => i * 2 }
    if ( a3 != 2 ) {
        return 1
    }
    var a4 = foo3(){}
    if ( a4 != 1 ) {
        return 1
    }
    return 0
}

func foo1(a: Int64, fn: (Int64)->Int64) { fn(a) }

func foo2(fn: (Int64)->Int64) { fn(1) }

func foo3(fn: ()->Unit) { return 1 }
func foo3()(fn: ()->Unit) { return 2 }
