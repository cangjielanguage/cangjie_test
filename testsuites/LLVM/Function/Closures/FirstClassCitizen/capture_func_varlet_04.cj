// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a: Int32 = 1

    func foo( x!:Int32=a ) {
        return x
    }

    func test(y : (Int32)->Int32) {
        return y(a)
    }

    var ret = test(foo) //EXPECTED: regex error.*?foo captured a mutable variable directly, foo cannot be used as a param

    if ( ret != 1 ){
        return 1
    }

    return 0
}


