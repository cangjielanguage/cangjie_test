// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if (foo(1) != 2){
        return 1
    }
    var m = foo
    if (m(1,1) != 1){
        return 1
    }
    return 0
}

func foo(x:Int32,y!:Int32 = x+1){return y}