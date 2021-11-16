// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a: Int32 = 1

    func test(a : ()->Int32) {
        return a()
    }

    var ret = test({return a})  //EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param

    if ( ret != 1 ){
        return 1
    }
    return 0
}