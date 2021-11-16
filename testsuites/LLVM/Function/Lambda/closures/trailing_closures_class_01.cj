// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

class B {
    var m:Int64 = 1
    init()(fn: ()->Unit) { m =  2 } // EXPECTED: regex constructor cannot have more than one parameter list
}

class A {
    var m:Int64 = 1
    A()(fn: ()->Unit) { m =  2 } // EXPECTED: regex constructor cannot have more than one parameter list
}