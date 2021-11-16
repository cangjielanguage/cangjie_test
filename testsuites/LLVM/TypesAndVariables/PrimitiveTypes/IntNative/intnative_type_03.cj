// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a1: IntNative = -1
var b1: UIntNative = 0

var c1 = match (a1){
    case _:Int32 => 1
    case _:Int64 =>2
    case _:IntNative => 0
    case _ => 4
}
var c2 = match (a1){
    case _:Int32 => 1
    case _:IntNative => 0
    case _:Int64 => 2
    case _ => 4
}

func main():Int64 {
    if ( c1 != 0) {
        //print("${c1}")
        return 1
    }
    if ( c2 != 0) {
        return 2
    }
    return 0
}
