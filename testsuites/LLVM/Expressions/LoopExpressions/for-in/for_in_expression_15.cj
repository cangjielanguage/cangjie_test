// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 32 ) {
        return 1
    }
    return 0
}

func case01(){
    func foo(input:Int64):Int64{input}
    let intList: List<(Int64)->Int64> = [foo, foo, foo, foo, foo]
    var a: Int64 = 1
    for (item in intList) {
        a = a + item(a)
    }
    a
}


