// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I{
func foo(){
  return 1
}
}

enum TimeUnit{
Month |
Year
}

extend TimeUnit <: I{
func foo){
  return 1
}

    func Day() {
        return foo()
    }
}

func main(): Int64 {
let a = TimeUnit.Month
let b = TimeUnit.Year
    return a.Day() - 1
}