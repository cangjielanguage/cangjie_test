// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:Data<Int32> = Data<Int32>()
    if ( a +<Int64> 1 != 0){
        return 1
    }
    if ( a + Int64(2) != 0){
        return 2
    }
    return 0
}

class Data<T> {
    operator func +<V>(right:Int64):UInt8  {return 0} //EXPECTED: regex error.*?generic is not allowed in operator overload function
}
