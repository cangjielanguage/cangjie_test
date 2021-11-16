// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

operator var opt: Option<String> = .Some<String>("option")  // EXPECTED: regex 'operator' modifier is illegal for variable declaration

func run(): Int64 {
    var str: String = match (opt) {
        case Some(x) => x
        case $None => ""
    }
    if(str == "option"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}