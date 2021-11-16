// EXEC: %compiler %cmp_opt %n.cj -o %output
// ASSERT: regex-not core dump

func main():Int64 {
    let a: Int32 = 1

    func test(a : ()->Int32) {
        return a()
    }

    var ret = test({return a})

    if ( ret != 1 ){
        return 1
    }
    return 0
}