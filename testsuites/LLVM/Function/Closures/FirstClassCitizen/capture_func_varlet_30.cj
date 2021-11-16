// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a: Int32 = 1

    func foo() {
        return a
    }

    func test() : ()->Int32 { match {case _ => foo} } //error: type of return expression is incompatible with return type

    if ( test()() != 1){
        return 1
    }

    return 0
}