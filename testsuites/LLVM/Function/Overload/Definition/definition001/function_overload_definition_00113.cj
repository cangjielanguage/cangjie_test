// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
return run()
}
func run():Int64 {
test_samename()
}

func test_samename(){
func foo_same(x:Int32,y:Int64){}
func foo_same(){}
func foo_same(x:Int32):Int64{1}
var f1:(Int32)->Int64 = foo_same
return 0
}
