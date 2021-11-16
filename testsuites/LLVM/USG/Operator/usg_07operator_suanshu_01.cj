// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    let a = 5
    let b = 10

    if ( -a != -5) {
        return 1
    }
    if ( a + b != 15 ) {

    }
    if ( a - b != -5 ) {

    }
    if ( a * b != 50 ) {

    }
    if ( b / a != 2 ) {

    }
    if ( b % a != 0 ) {

    }
    if ( a ** b != 9765625 ) {

    }
    0
}