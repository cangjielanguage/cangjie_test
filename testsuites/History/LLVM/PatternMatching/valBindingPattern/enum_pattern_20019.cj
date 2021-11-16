// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: regex-not fail

enum D<T>{d(T)|d}

enum E<T>{e(D<T>)|e}

func test<T>(i_:T){
    var a : E<T> = e(d(i_))
    var i = d<T>
    var res = match (a){
        case e(x@$d) => x
        case e(x@d(v)) => x
        case $e => i
        case _ => print("fail\n"); i
    }
    match (res){
        case $d => 1
        case d(_) => 0
    }
}

func main(): Int64 {
    test(1)
}
