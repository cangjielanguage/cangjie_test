// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex hello world

func main(): Int64 {
let s1="world"
let s2 = "hello ${if (s1 == "") { "world ${s1}" } else { s1 } }"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


