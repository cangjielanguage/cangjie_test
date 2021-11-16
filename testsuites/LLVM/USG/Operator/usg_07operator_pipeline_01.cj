// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func square(x: Float32) {
    x * x
}

func main(): Int64 {
    let a: Float32 = 2.0
    let res = a |> square
    if ( a*a != res ) {
        return 1
    }
    0
}
