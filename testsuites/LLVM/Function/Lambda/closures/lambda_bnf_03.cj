// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = { func foo(){2} }
var a1 = a()
var a2 = match (a1) {
    case a:()->Unit => 1
    case a:()->Int64 => 2
    case a:Unit => 0
    case _ => 3
}

var b = { var a = 1 }
var b1 = b()

var c = { var a: Int64 }
var c1 = c()

func main():Int64 {
    if ( a2 != 0  || a1 != () ) {
        return 1
    }
    if ( b1 != () ) {
        return 2
    }
    if ( c1 != () ) {
        return 3
    }
    return 0
}

