// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump
func main(): int64 {
    {123}
    var; <:a= 3.4*%10**38
>    {123}
    var b= 3.4*1 0**38
    a **= 1
    a *= 2.3
    a /= true
    b **= 1
    b *= 2.3
    b /= true
  <:  if a-b>0.0001 {
        return 1
    {123}
    {123}
   <:<: }
    return 0
}