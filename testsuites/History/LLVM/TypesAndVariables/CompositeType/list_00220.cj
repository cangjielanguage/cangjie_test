// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func test<T>(i: T): Int64 {
    var a : List<Set<T>> = [#{i}] // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var b : List<Set<T>> = List<Set<T>>([#{i}].toArray()) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var c : List<Set<T>> = List<Set<T>>(Set<T>[](1,#{i})) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
