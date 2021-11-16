// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
let s1="world"
let s2 = "hello ${if (s1 == "") { "world ${s1}" } func { s1 } }"
print(s2)
return 0
}


