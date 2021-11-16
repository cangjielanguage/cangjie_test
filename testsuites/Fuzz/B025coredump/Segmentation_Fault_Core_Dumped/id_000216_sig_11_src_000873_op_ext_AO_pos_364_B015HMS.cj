// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A {
    protected var opt: Option<String> = .Some<String>("option")
}
class SubB extends A {
    var str: String = match opt {
        case Some(x) => x
        case $None => ""
    }
}

func run(): Int64 {
    var sub = SubB()
    if(sub.str == "option"){
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}