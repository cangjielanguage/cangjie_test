// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 10 ) {
        return 1
    }
    return 0
}

func case01(){
    let intRange = 0..5
    var a: Int64 = 0
    for (item in intRange) {
        a = a + item
    }
    a
}

