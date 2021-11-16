// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo1<T>(x: T): Option<T>{
    return Option<T>.Some(x)õ

func foo2<T>(): Option<T>{
    return Option<T>.None
}

func run(): Int64 {
    var res1: String = match foo1<String>("Option"){
        case Some(x) => x
        case $None => ""
    }
    var res2: Int32 = match foo2<Int32>(){
        case Some(x) => x
        case $None => 0
    }

    if (res1 == "Option" && res2 == 0){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}