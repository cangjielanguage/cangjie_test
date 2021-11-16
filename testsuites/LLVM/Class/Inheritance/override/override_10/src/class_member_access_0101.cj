// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle   -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkga.*

class Data <: Base{
	  func foo(): Int32 { // EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
        return 4
    }
}

func main(): Int64 {
    return 0
}
