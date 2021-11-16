// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not overridden function 'foo' should have 'open' modifier
// ASSERT: regex-not need 'override' modifier for function 'foo'

func main(): Int64 {
    return 0
}

abstract class Base {
   static func foo(): Int32 {
       return 0
   }
}

class Data <: Base {
   func foo(): Int32 { //EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
        return 4
   }
}
