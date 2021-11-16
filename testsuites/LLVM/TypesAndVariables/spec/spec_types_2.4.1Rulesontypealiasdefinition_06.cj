// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

type Int = Int32

func add(left: Int, right: Int32): Int { left + right }
func add(left: Int32, right: Int32): Int32 { left + right } // EXPECTED: regex function 'add' has overload conflicts

func main(){
    let numOne: Int32 = 10
    let numTwo: Int = 20
    let numThree = numOne + numTwo
    add(numTwo,numOne)
    return 0
}

