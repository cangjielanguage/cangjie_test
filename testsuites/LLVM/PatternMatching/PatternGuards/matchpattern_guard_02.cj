// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01(1.0) != 0 ) {
        return 1
    }
    if ( case02(1.0) != 0 ) {
        return 1
    }
    return 0
}

func case01(x: Float32){
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (Year(x)) {
        case Year(x)  if (x != 1.0 ) => 1
        case Year(x)  if (x == 1.0 ) => 0
        case _ => 2
    }
    return result
}

func case02(x: Float32){
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (Year(x)) {
        case _  if (x != 1.0 ) => 1
        case _ if (x == 1.0 ) => 0
        case _ => 2
    }
    return result
}

enum TimeUnit {
    Year(Float32)
}
