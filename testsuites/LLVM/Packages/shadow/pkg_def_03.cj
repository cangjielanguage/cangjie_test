// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o tmp/%output  2>&1 | compare %f
// ASSERT: regex-auto IO failure on output stream

func main() {
   return 0
}

