// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func a(){
    func test(a:Int8):Int8{return 1}
}

func b(){
    func test(a:Int16):Int16{return 2}
}



func main():Int64{
    return 0
}