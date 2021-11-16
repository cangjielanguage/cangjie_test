// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return 0
}

abstract class Base {
   func foo(): Int32
}

class Data <: Base {
    static func foo(): Int32 { // EXPECTED: regex static member 'foo' cannot have the same name with non-static member in parent class or interfaces
        return 4
    }
}
