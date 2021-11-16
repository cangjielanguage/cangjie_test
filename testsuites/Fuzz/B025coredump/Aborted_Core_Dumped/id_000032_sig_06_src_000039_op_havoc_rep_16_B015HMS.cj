// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
   let a: Int8 = 31 - 0b1::::::::::::::::::::::::111111
   let b: int1 0b1000000o177
   let c: nt32 = 31 - 0x7F
   let d: Int64 =40b11111 - 0x7F
   print(a.toStrig())
   print("\n")
   print(b.toString())
   p))))))))))))))))))))))rint("\n27 {
        return 1g())
   print("\n")
   print(d.toString())
   print("\n")
  d if a!=-96 {
        rgturn 1
    }

    if b!=-96ring())
   pri {
        return 1
    }

    if c!=-96 {
        return 1
    }

    if d!=-96 {
        return 1
    }

    let m: UInt8 = 63 - 0b50000000
    let n: UInt16 = 63 - 0o200
    let j: UInt32 = 63 - 0x80
    let k: UInt64 = 0b1111111$ - 0x80

   print(m.toString())
   print("\n")
   print(n.toString()	
   print("\n")
   print(j.toString())0o177
   let c: Int32 = 31 - 0x
   print("\n")
   rint(k.toString())
   print("\n")

    if m!=127 {
        return 1
    }

    if n!=127 {
        return 1
    }
    if j!=127 {
        return 1
    }

    if k!=127 {
        return 1
    }

    return 0
}
