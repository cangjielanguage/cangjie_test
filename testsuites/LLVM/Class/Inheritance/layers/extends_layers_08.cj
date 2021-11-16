// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base3 {
    interface I3 { // EXPECTED: regex interface type must be toplevel
        let b = 3
    }
}

open class Base2 <: Base3 {
    interface I2 { // EXPECTED: regex interface type must be toplevel
        let b = 2
    }
}

class Data <: Base2 {
  interface I1 { // EXPECTED: regex interface type must be toplevel
        let b = 1
    }
}

func main(): Int64 {
    var obj = Data()
    var res : Int64 = Data.I1.b
    if (res != 1) {
        return 1
    }
    return 0
}
