// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowSaturating
func test(a:Int8){
    var b = a;
    b++
    return b
}

func main(){
    return Int64(test(127)- 127)
}
