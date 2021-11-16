// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}


func foo(x:Int64){
    return x - 1
}

func main(): Int64 {
    var a = 0
    var b : Result<Int64> = Ok(1)
    var c = foo
    b??a|>c
}
