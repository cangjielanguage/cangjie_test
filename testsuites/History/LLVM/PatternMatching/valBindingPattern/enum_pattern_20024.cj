// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan aaa0bbb


func test<T>(i_:T){
    var a = 1
    let i = 1
    print("aaa")
    var res = match (a){
        case x@_ => print("0");i
        case x@$i => print("1");i
    }
    print("bbb")
    return 0
}

func main(): Int64 {
    test(1)
}
