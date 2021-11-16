// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
record A<X>{}

trait update{
    operator func +(a:This,b:A<Int8>):Bool
    operator func +(a:A<Int8>,b:This):Bool
}

append<X> A<X> with update {
    operator func +(a:A<X>,b:A<Int8>):Bool  {true}
    operator func +(a:A<Int8>,b:A<X>):Bool  {false}
}

func main(): Int64 {
    var a : A<Int8> = A<Int8>()
    var b : A<Int8> = A<Int8>()
    if (!(b+a)) { // EXPECTED: regex-auto ambiguous match for + overload function call
        return 1
    }
    return 0
}
