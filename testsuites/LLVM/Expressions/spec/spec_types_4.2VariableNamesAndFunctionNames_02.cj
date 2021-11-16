// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func identity<T>(a: T) {  // identity is a generic function
    return a
}

func main():Int64{ 
    var b = identity  // EXPECTED: regex generic type should be used with type argument
    var c = identity<Int32>  // ok: Int32 is given as a type argument
    return 0
}

