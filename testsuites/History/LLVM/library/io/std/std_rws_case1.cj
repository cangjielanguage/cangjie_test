// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan false
// ASSERT: scan-next true
// ASSERT: scan-next false
// ASSERT: scan-next false
// ASSERT: scan-next true
// ASSERT: scan-next false
// ASSERT: scan-next true
// ASSERT: scan-next false
// ASSERT: scan-next false

import io.*

func main(): Int64 {

Print(stdout.canRead().toString())
Print(stdout.canWrite().toString())
Print(stdout.canSeek().toString())
Print(stderr.canRead().toString())
Print(stderr.canWrite().toString())
Print(stderr.canSeek().toString())
Print(stdin.canRead().toString())
Print(stdin.canWrite().toString())
Print(stdin.canSeek().toString())
return 0

}
