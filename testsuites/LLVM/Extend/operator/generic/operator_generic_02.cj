// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:Int32 = 1
    if ( a +<Int32> Int64(1) != 0){
        return 1
    }
    return 0
}

extend Int32 {
    operator func +<T>(right:Int64):UInt8  {return 0} //EXPECTED: regex error.*?generic is not allowed in operator overload function
}
