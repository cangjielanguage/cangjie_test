// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
   let a: Int8 = 0o340 - 0o141 // EXPECTED: regex the number '0o340' exceeds the value range of type 'Int8'

   if (a != 127) {
      return 1
   }

    return 0
}