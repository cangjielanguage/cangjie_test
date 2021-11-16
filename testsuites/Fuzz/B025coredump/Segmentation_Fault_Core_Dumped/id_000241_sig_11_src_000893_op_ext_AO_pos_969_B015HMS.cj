// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data<T> {
    var opt: Option<T>
    init(x: Option<T>){
        opt = x
    }
    func f(x: Option<T>): Option<T>{
        return x
    }
}

func run(): Int64 {
    var data1: Data<Int32> = Data<Int32>(Option<Int32>.Some(2))
    var data2: Data<Int32> = Data<Int32>(Option<Int32>.None)
    var opt1 = data1.opt
    var opt2 = data1.f(Option<Int32>.Some(3))
    var opt3 = data2.opt
    var opt4 = data2.f(Option<Int32>.None)
    var res1: Int32 = match opt1 {
        case Some(x) => x
        case $None => -1
    }
    var res2: Int32 = match opt2 {
        case Some(x) => x
        case $None => -1
    }
    var res3: Int32 = match opt3 {
        case Some(x) => x
        case $None => -1
    }
    var res4: Int32 = match opt4 {
        case Some(x) => x
        case $None => -2
    }

    if ( res1 == 2 && res2 == 3 && res3 == -1 && res4 == -2) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}
