// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    Coo()
    return 0
}

open class Boo{}

class Coo <: Boo {
    var a0:Int32 = 1
    let a1:Int32 = 1
    var a2 = { a0 } // EXPECTED: regex error.*?'a0' is not allowed to be accessed before all member variables are initialized
    var a3 = a0 // EXPECTED: regex-not error
    var a4 = { a0 }() // EXPECTED: regex error.*?'a0' is not allowed to be accessed before all member variables are initialized

    static var b0:Int64 = 1
    var b1 = { b0 } // EXPECTED: regex-not error
    var b2 = b0 // EXPECTED: regex-not error
    var b3 = { b0 }() // EXPECTED: regex-not error
}

class Doo <: Boo {
    let a0:Int32 = 1
    let a1:Int32 = 1
    let a2 = { a0 }() // EXPECTED: regex error.*?'a0' is not allowed to be accessed before all member variables are initialized
}