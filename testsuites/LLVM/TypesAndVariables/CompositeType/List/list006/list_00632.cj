// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<Int64> = [1,2,3]
    let getN = a.get(3)
    let b = match(getN){
        case Some(x) => "${x}"
        case $None => "None"
    }
    return 0
}

func main(): Int64 {
    test()
}
