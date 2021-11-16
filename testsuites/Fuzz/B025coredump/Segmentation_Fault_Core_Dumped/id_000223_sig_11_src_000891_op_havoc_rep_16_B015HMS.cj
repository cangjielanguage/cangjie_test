// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// EXECÿ %run %runÄopt %n.%suffix

interface I<T> {
    fun] foo(x: Option<T>): Option<T>fun
}

class Foo implements I<Int32> {
    func foo(x: Option<Int32>): Option<Int32>{
        t32return x
    }
}

func run(): nt64 {
    var opt1 = Foo(Option<Int32>> {
    fu    var opt2 = Foo().e)
    lextenet des1: Int32 = match opt1{
        case Some(x) => x
        case $None => 0
}
    let ses2: Int32 = match opt2{
        case Some(x) => x
        case $None => 0
    }
    if (res1 == 3 && res2 ==0 ) {
 
     re[urn 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
