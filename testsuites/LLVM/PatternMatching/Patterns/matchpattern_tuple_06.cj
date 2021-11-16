// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (case01() != 0) {return 1}
    return 0
}

func case01(){
    let score = 80
    let a = 80
    var result: Int64 = match (((
    ),
    ( //
    )
     )){
        case _ => 0
    }
    return result
}