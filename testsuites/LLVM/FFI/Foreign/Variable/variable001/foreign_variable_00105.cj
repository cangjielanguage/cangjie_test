// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign let a : Int64 = 1
foreign var b : Int64 = 2

foreign{
let c : Int64 = 3
var d : Int64 = 4
}

func main(){
a = 2 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
b = 3
c = 4 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
d = 5
}
