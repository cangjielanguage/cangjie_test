// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a = 0b00001110
    var b = 3

    var c = a >> b
    var d = a << b

    if ( a != 14 ) {
        return 1
    }
    if ( b != 3 ) {
        return 1
    }
    if ( c != 1 ) {
        return 1
    }
    if ( d != 112 ) {
        return 1
    }

    0
}