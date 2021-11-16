// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class R{
    func a(a: Int32, b!: Bool = true){
       c = 10
       if(b){
          c = 5
       }
    }
}

var c: Int32 = 0
let b = R().a

func main(): Int64{
    b(1) // EXPECTED: regex  missing argument for call with parameter list: \(Int32\, Bool\)
    return Int64(c - 5)
}
