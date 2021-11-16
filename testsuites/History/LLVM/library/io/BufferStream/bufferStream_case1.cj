// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan true
// ASSERT: scan-next true
// ASSERT: scan-next true
// ASSERT: scan-next true
// ASSERT: scan-next true
// ASSERT: scan-next true


import io.*

func main(): Int64 {

let pathname: String = "tmp1.txt"
var fs: FileStream = FileStream(pathname)
var bs: BufferStream = BufferStream(fs)
Print(fs.canSeek().toString())
Print(fs.canRead().toString())
Print(fs.canWrite().toString())
Print(bs.canSeek().toString())
Print(bs.canRead().toString())
Print(bs.canWrite().toString())

return 0

}
