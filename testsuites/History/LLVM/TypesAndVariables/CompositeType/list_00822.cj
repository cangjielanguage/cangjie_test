// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func test<T>(input:T){
    var a : Map<List<T>,List<T>> =#{[input]:[input]} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 1
}

func main(): Int64 {
    return 1
}
