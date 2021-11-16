// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Data<Int32> = Data<Int32>()
    if ( a + Int64(1) != 0){
        return 1
    }
    if ( a - Int32(1) != 1 ){
        return 1
    }
    return 0
}

class Data<T> {
    operator func +(right:Int64):UInt8  {return 0}
    operator func -(right:T):T  {return right}
}
