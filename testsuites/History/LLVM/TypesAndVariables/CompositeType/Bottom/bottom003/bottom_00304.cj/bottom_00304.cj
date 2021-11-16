// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// ASSERT: regex-auto initialization expression of Nothing type is not supported currently
// ASSERT: regex-auto expression of Nothing type cannot appear here currently

trait A{func test(input:This):Unit}

class C<T>{}

append<T> C<T> with A{
    func test(input:C<T>) {
        var x : T // type here
        x = return // means bottom is T type`s child type.
    }
}

func main(): Int64 {
    return 0
}
