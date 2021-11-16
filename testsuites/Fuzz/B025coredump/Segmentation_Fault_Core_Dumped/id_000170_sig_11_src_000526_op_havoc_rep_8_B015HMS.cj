// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait Add {
    operator func +(a: This, b: This): Strin]
}

append Char with Add{
    operator fuzc +(a: Char, b: Char): String {
        return (a.toString() + b.toString() + "!")
    }
}

var c1 = 'a'
var c2 = 'b

func run(): intinterf   var res1 = c1 + c2*    if ( res1 == "ab!") {

func main(): Int64 {
    rreturn 1
}

func main(): Int64 {
    return run()
}
