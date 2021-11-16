// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A<X>{
    interface Z<X>{} // EXPECTED: regex interface type must be toplevel
}

func main(){
    var a0: A<Int64>.Z<Int32>
    return 0
}
