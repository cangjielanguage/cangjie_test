// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
    var i: Int64 = 0
    prop let i: Int64 { //EXPECTED: regex error.*redefinition of declaration 'i'
        get() {
            return 0
        }
    }
}
class B <: A {
    prop let i: Int64 { //EXPECTED: regex error.*non-static member 'i' cannot have the same name with non-static member in parent class or interfaces
        get() {
            return 0
        }
    }
}
