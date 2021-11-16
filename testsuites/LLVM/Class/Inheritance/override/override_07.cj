// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return Int64(Data().foo() - 3)
}

open class Base {
   static func foo(a!: Int32 = 1): Int32 {
       return a
   }
}

class Data <: Base{
   func foo(): Int32{// EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
       return 1
   }
}
