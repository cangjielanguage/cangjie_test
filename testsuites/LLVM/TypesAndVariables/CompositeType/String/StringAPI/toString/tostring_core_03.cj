// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var IntNative_MIN: IntNative = -0x8000000000000000
var IntNative_Max: IntNative = 0X7FFFFFFFFFFFFFFF // if Not run on 64bit,will error
var a4: List<IntNative> = [IntNative_MIN,IntNative_MIN+1,-1,0,1,31,32,100,IntNative_Max-1,IntNative_Max]
var a4s:  List<String> = ["-9223372036854775808","-9223372036854775807","-1","0","1","31","32","100","9223372036854775806","9223372036854775807"]
var UIntNative_MIN: UIntNative = 0x0000000000000000
var UIntNative_Max: UIntNative = 0XFFFFFFFFFFFFFFFF
var aa4: List<UIntNative> = [UIntNative_MIN,UIntNative_MIN+1,31,32,100,UIntNative_Max-1,UIntNative_Max]
var aa4s:  List<String> = ["0","1","31","32","100","18446744073709551614","18446744073709551615"]

func main(): Int64 {
    for ( item in 0..a4.size() ) {
        if ( !a4[item].toString().equals(a4s[item]) ){
            return 1
        }
    }
    for ( item in 0..aa4.size() ) {
        if ( !aa4[item].toString().equals(aa4s[item]) ){
            return 2
        }
    }
    return 0
}