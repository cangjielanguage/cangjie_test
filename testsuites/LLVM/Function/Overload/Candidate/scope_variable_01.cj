// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var res: Int32 = 1
func main():Int64 {
    var b = foo()
    if ( res != 2 ){
        return 1
    }
    return 0
}

func foo(){
    var a = res
    res++ //bug error: usage of a variable 'res' which is not defined yet
    res
}
