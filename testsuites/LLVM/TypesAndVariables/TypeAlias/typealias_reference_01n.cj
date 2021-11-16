// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data<T>{}


type CD = Data<CD>  // EXPECTED: regex type cycle detected: 'CD->CD'

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    return 0
}