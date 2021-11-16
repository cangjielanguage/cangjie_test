// ERRCHECK: %compiler %cmp_opt %n.cj -o %output
// ASSERT: scan exceeds the value range of type 'Int64'

func main(): Int64 {
    var a:Int32 = 1
    var b:Int32 = 0
    var c:Int64 = 170141183460469231731687303715884105728
    var d:Int32 = 0
    b = a << 127
    if (b != c) {
        return 1
    }
    d = c >> 127
    if (d != a) {
        return 1
    }
    return 0 
}
