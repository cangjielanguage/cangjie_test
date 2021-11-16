// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    let a: Int32 = 1

    func foo( x!:Int32=a ) {
        return x
    }

    func test(y : (Int32)->Int32) {
        return y(a)
    }

    var ret = test(foo)

    if ( ret != 1 ){
        return 1
    }

    return 0
}


