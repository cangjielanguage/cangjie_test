// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign let a : Int64
foreign var b : Int64

foreign{
let c : Int64
var d : Int64
}

func main(): Int64 {
    a = 2 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    c = 3 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    0
}
