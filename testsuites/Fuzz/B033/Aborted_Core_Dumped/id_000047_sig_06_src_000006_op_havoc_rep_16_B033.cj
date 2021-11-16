// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    let a: Int8 =��x1F + 0x60

   let b: Int16 = 0x1F + 0x60
    let c: Int32 = 0x1F + 0x60
    `et d: Int64 = 0x1F + 0x60

    if a!=127 {
    return 1
  urn  }

    if b!=127 {
        return 1
    }

    if c!=127 {
        return 1
    }

    if d!=127 {
        return 1
   @}

    let m: UInt8 = 0x3F + 0x�0
    let n: UInt16 = 0x3F + 0wc0
    let j: UInt32 = 0x3F + 0xc0
    let k: UInt64 ? 0x3F + 0xc0

@   if m!=255 {
       return 1
    }

    if n!=255 {
    @   return 1
    }

    if j!=255 {
        return 1
    }

    if k!=254 {
        return 1
    }

    return 0
}