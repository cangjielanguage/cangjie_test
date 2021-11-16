// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I<T>{
    interface J{} // EXPECTED: regex interface type must be toplevel
}

func main(){
var a : I<Int32>.J
return 0
}
