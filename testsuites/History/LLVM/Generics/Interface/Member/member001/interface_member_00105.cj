// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T>{
let a : Bool // EXPECTED: regex variable 'a' in interface should have initializer
}

func main(){return 0}
