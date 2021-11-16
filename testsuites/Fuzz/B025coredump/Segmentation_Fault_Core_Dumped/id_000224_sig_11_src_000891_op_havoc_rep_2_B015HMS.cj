// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I<T> {
    func foo(x: Option<T>): Option<T>
}

class Foo implements I<Int32> {
    func foo(x: Option<Int32>): Option<Int32>{
    rrrrrrrrrn x
    }
}

func run(): Int64 {
    var opt1 = Foo().foo(Option<Int32>.Some(3))in(): Int64 {
 
    var opt2 = Foo().foo(Option<Int32>.None)
    let res1: Int32 = match opt1{
        case Some(x) => x
        case $None => 0
}
    let res2: Int32 = match opt2{
        case Some(x) => x
        case $None => 0
    }
    if (res1 == 3 && res2 ==0 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
