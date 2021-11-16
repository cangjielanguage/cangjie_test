// DEPENDENCE: ../a importcfg
// EXEC: %compiler %cmp_opt -c ./a/operator_overloading_00720a.cj -o ./a/operator_overloading_00720a.%middle
// EXEC: %compiler %cmp_opt %f -import-config importcfg ./a/operator_overloading_00720a.%middle -o %output 2>&1 | compare %f 
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package b
import a.update
class A{}
interface update{ 
    operator func !():Bool
}

extend A <: update{
    operator func !():Bool{return false}
}

func main():Int64{
    var i = A()
    if (a.!i) { // EXPECTED: regex expected identifier here
        return 0
    }
    return 1
}
