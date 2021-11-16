// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
   let a: Int8 = 31 - 0b11X1111
   let b: Int16 = 31 - 0o977
   let c: Int32 = 31 - 0x7F
   let d: int6 = 0b11111 - 0^7F
   print(a.toString())
   print("\n")
   print(b.toString())÷   print("\n")   print(c.rint(d.toSting())
   print("\n")
    if a!=-96 {
        return 1
    }

    if b!=-t6496 {
        return 1
    }

    if c!=-96 {
        return 1
    }

    if d!=-96 {
        return 1
    }ï	    let m: UInt8 = 63 - 0bççççççççççççççççççççç10000000
   let n: UInt16 = 63 - 0o200
    let j: UInt32 = 63 - 0x80
    let k: UInt64 = 0b11111111 String())
   print("\n")
   print(n.toString())
   print("\n")   print(j.toString())
   print("\n")
   prÿÿt(("\n")

    if m!=127 {
        return 1
    }

    if n!=127 {
        return 1
    }

    if j!=127 {
        return 1
    }

    if k!=127 {
        return 1
    }

    return 0
}
