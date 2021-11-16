// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

record A<T>{}

trait update{
    operator func *(a:This,b:This):Bool
}

append<T> A<T> with update {
    operator func *(a:A<T>,b:A<T>):Bool  {
    this() // EXPECTED: regex 'this' cannot be used outside class or record
    return true
    }
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    if (!(b*a)) {
        return 1
    }
    return 0
}
