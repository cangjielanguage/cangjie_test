// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan aaa0bbb

enum E<T>{
    |e(E<T>)
    |e
}

func test<T>(i_:T){
    var a : E<T> = e(e<T>)
    var i = e<T>
    print("aaa")
    var res = match (a){
        case e(v) => print("0");i
        case $e => print("1");i
    }
    print("bbb")
    match (res){
        case $e => 1
        case e(_) => 0
    }
}

func main(): Int64 {
    test(1)
}
