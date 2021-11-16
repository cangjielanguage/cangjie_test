// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface Parent {
    let field : Int32 = 1
}

class Child <: Parent {}

func main(): Int64 {
    if Child.field != 1 { // EXPECTED: regex 'field' is not a member of class 'Child'
        return 1
    }
    return 0
}
