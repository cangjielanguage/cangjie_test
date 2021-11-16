// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
interface I0{
  static func F0():Int32{return 0}
}

func main(): Int64 {
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
