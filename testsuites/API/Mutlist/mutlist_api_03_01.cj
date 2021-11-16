// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var r1:Buffer<String> = Buffer<String>(9223372036854775808) // EXPECTED: regex error.*?the number '9223372036854775808' exceeds the value range of type 'Int64'
var a:Int32  = 1
var r2:Buffer<String> = Buffer<String>(a) // EXPECTED: regex error.*?parameters and arguments mismatch
var r3:Buffer<String> = Buffer<String>(-9223372036854775809) // EXPECTED: regex error.*?the number '-9223372036854775809' exceeds the value range of type 'Int'

func case01(){
    var a = r1.size()
    return a
}

func case02(){
    var a = r2.size()
    return a
}

func case03(){
    var a = r3.size()
    return a
}

func main(): Int64 {
    if ( case01() != 0 ){
        return 1
    }
    if ( case02() != 0 ){
        return 2
    }
    if ( case03() != 0 ){
        return 3
    }
    return 0
}
