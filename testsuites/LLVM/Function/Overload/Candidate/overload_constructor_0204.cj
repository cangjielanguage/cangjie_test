// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = match (foo) {
        case foo(x) => 1
        case foo(x,y) => 2
        case foo => 0
        case _ =>4
    }
    if ( a != 0 ) {
        return 1
    }
    var b = match (foo(1)) {
        case foo(x) => 0
        case foo(x,y) => 2
        case foo => 3
        case _ =>4
    }
    if ( b != 0 ) {
        return 1
    }
    var c = match (foo(1,1)) {
        case foo(x) => 1
        case foo(x,y) => 0
        case foo => 3
        case _ =>4
    }
    if ( c != 0 ) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo |
    foo(Int32) |
    foo(Int32,Int32)
}
