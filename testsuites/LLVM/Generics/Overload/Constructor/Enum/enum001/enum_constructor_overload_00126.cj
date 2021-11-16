// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Father{}

class Child <: Father{}


enum B{a(Child)}

enum A{a(Father)}

func main():Int64{
    var j = a(Child()) // EXPECTED: regex find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : B => 0
        case _ => 1
    }
    return res_j
}