// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I<T>{
    class J<Y>{} // EXPECTED: regex class type must be toplevel
}

func main(){
var a : I<Int32>.J<Int64>
return 0
}
