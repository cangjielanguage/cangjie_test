// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<X>{
    static func foo():Int32
}

func main(){
return I<Int64>.a(0)
}
