// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan aaa1bbb


enum D<T>{d(T)|d}

enum E<T>{
    |e(E<T>)
    |e
}

func test<T>(i_:T){
    var a : E<T> = e(e(e<T>))
    var i = e<T>
    print("aaa")
    var res = match (a){
        case e(x@e(v)) => print("1");i
        case e(x@$e) => print("0");i
        case $e => print("2");i
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
