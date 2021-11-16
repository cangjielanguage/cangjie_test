// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a =  [0,1,2,3,4,5,6,7,8,9,10]

func main(){
    var A = Option<Array<Int64>>.Some(Array<Int64>(a))
    A?[sourceLine()] = sourceLine()
    return 0
}