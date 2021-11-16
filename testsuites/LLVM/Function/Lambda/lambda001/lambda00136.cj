// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let sum = { a: Range<Int64> => a}
    let d : Range<Int64> = 0..18:8
    let c : Range<Int64> = sum(d)
    if( c == d){
    	return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
