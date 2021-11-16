// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func foo<T>(a:T):T{
    return a
}
var lmd = { a:Int8 => Int32(a)}
func main(): Int64 {
    lmd(128) // EXPECTED: regex the number '128' exceeds the value range of type 'Int8'
    return 0
}