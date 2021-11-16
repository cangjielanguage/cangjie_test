// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func Some<T>(a:T){}

func main(): Int64 {
    var a = Some(1) // EXPECTED: regex ambiguous match for function call 'Some'
    return 0
}
