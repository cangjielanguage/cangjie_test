// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func test<T>(i: T): Int64 {
    var a : List<Map<T,T>> = [#{i:i}] // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var b : List<Map<T,T>> = List<Map<T,T>>([#{i:i}].toArray()) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var c : List<Map<T,T>> = List<Map<T,T>>(Map<T,T>[](1,#{i:i})) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
