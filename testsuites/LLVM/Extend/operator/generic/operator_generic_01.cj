// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int32 = 1
    if ( a + Int64(1)!= 0){
        return 1
    }
    return 0
}

extend Int32 {
    operator func +(right:Int64):UInt8  {return 0}
}
