// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a = 0b00001110
    var b = 0b00101101

    var c = a & b
    var d = a ^ b
    var e = a | b
    var f = !b

    if ( a != 14 ) {
        return 1
    }
    if ( b != 45 ) {
        return 1
    }
    if ( c != 12 ) {
        return 1
    }
    if ( d != 35 ) {
        return 1
    }
    if ( e != 47 ) {
        return 1
    }
    if ( f != -46 ) {
        return 1
    }
    0
}