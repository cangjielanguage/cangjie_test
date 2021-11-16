// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Foo<T>{
    var data: T
    init(data1: T){
        data = data1
    }
}

func run(): Int64 {
    let opt = Option<Int32>.Some(3)
    var foo: Foo<Option<Int32>> = Foo<Option<Int32>>(opt)
    var res: Int32 = match foo.data{
        case Some(x) => x + 1
        case $None => 0
    }
    if (res == 4){
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}
