// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 4 ) {
        return 1
    }
    if ( case02() != 4 ) {
        return 1
    }
    if ( case04() != 1.0 ) {
        return 1
    }
    return 0
}

func case01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    for (item in intList) {
        a = item
    }
    a
}

func case02(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    for (item in intList) {
        a = match (item) { case item => item}
    }
    a
}

func case04(){
    let intList: List<TimeUnit> = [Year(1.0), Month(1.0,1.0)]
    var a: Float32 = 0.0
    for (x in intList) {
        a = match (x) { case Year(x) => x;case Month(x,y) => x;case _ => 3.0}
    }
    a
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
}
