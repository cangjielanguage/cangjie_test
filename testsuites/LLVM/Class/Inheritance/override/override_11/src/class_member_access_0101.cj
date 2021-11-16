// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle   -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkga.*

class Data <: Base{
    func foo(): Int64{
        5
    }
}

func main(): Int64 {
    return Int64(Data().foo() - 5)
}
