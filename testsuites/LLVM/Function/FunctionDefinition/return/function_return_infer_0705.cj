// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if (case02(0.0,1.0) != 0) {
        print(case02(0.0,1.0).toString())
        return 2
    }
    return 0
}

func case02(x: Float32, y: Float32){
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    match ((Year(x),Year(y))){
        case _  if ( x < y ) => 0
    }
}

enum TimeUnit {
    Year(Float32)
}
enum TimeUnit3 {
    Year(TimeUnit)
}
