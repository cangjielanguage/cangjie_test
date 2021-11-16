// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Data()
if (res1.x == 5){
return 0
}
return 1
}


class Data{
var x: Int32 = 1
var y: Int32 = 2
init(y!:Int32 = 4){
x = x+y
}
}



