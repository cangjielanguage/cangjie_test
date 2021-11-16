// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a: Int32 = 1

    func test() : ()->Int32 {
        return {return a}
    }

    var ret = test()()  //error: lambda captured a mutable variable directly, lambda cannot be used as a return value

    if ( ret != 1 ){
        return 1
    }

    return 0
}