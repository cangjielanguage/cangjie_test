// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class C1 {
    func foo() {}
}

class C2 <: C1 {}

func main(){

    return 0
}

