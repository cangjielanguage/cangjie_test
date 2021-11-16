// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan test

//Brief:StringStream 的 toString方法
from std import io.*

func main() {
  let s = StringStream("test")
  print(s.toString())
  0
}

