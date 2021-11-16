// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I3 {}
interface I4 <: I3 {}
interface I2 <: I4 {}
interface I1 <: I2 & I3 {}
class C1 <: I1 {}
enum B{a(I3)}
enum A{a(I4)}

func main():Int64{
    var j = a(C1()) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : A => 0
        case _ => 1
    }
    return res_j
}