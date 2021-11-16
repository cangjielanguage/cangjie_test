// ERRCHECK: %compiler %cmp_opt %n.cj -o %output
// ASSERT: scan exceeds the value range of type 'Int64'

func main(): Int64 {
    var a:Int8 = 1
    var b:Int8 = 0
    var c:Int64 = 85070591730234615865843651857942052864
    var d:Int8 = 0
    b = a << 126
    if (b != c) {
        return 1
    }
    d = c >> 126
    if (d != a) {
        return 1
    }
    return 0
}