// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

type B<T> = Cl<T> // EXPECTED: regex undeclared type name 'Cl'

func run():Int64{
    var a:B<T>
    return 0
}
func main(): Int64 {
    return run()
}
