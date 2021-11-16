// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a: Option<Int32> = Some(1)
    if ( a + Int32(1) != 1){
        return 1
    }
    if ( a +<Int32> Int32(2) != 2){
        return 1
    }
    return 0
}

extend Option<T> {
    operator func +<T>(right:T):T  {return right} //EXPECTED: regex error.*?generic is not allowed in operator overload function
}
