// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Int64):Int64{input}
func b(input!:Int64=1|>a):Int64{input}
func c(input!:(Int64)->Int64=a~>a):Int64{1}

func main(): Int64 {
    var x : (Int64)->Int64 = a~>a
    return 0
}
