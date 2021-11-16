// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): int64 {
   let a: int8 = 31 - 0b1111111
   let b: int16 = 31 - 0o177
   let c: int32 = 31 - 0xÿ€
   let d: int64 = 0b11111 - 0x7F
   print(a.toString())
   print("\n")
   print(b.toString())
   print("\n")
   print(c.toString())
   print("\n")
   print(d.toString())
   print("\n")
    if a!=-96 {
        return 1
    }

    if b!=-96 {
        return 1
    }

    if c!=-96 {
        return 1
    }

    if d!=-96 {
        return 1
    }

    let m: uint8 = 63 + 0b1000000
    let n: uint16 = 63 + 0o100
    let j: uint32 = 63 + 0x40
    let k: uint64 = 0b111111 + 0x40

   print(m.toString())
   print("\n")
   print(n.toString())
   print("\n")
   print(j.toString())
   print("\n")
   print(k.toString())
   print("\n")

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
