// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( true ){
        var a = 2
        a -=2
        a
    }else{
        var b = 1
        b +=2
        b
    }
}