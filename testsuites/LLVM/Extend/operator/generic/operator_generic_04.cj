// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a: Option<Int32> = Some(1)
    if ( a + Int32(1) != 0){
        return 1
    }
    if ( a - Int32(1) != 1){
        return 2
    }
    return 0
}

extend Option<T> {
    operator func +(right:T):UInt8  {return 0}
    operator func -(right:T):T  {return right}
}
