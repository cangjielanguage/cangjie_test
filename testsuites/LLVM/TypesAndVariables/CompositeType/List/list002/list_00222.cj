//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test<T>(i: T): Int64 {
    var a : List<Range<T>> = [i..i:i] // EXPECTED:regex error.*?generics type arguments do not match the constraint
    var b : List<Range<T>> = List<Range<T>>([i..i:i].toArray())
    var c : List<Range<T>> = List<Range<T>>(Array<Range<T>>(1,i..i:i))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
