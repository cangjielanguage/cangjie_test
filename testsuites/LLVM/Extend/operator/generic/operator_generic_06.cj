// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Data = Data()
    if ( a + Int64(1) != 0){
        return 1
    }
    return 0
}

class Data {
    operator func +(right:Int64):UInt8  {return 0}
}
