// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func add(i: Int64, j: Int64): Int64 {
    return i + j;
}
func add<T>(i: T, j: T): T where T <: Add { // EXPECTED: regex undeclared type name 'Add'
    return i + j;
}

func main():Int64{ 
    var plus = add // error: ambiguous function 'add'
    return 0
}

