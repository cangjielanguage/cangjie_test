// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: cat tmp6.txt| compare %f
// ASSERT: regex BCDEFGH

import io.*

func main(): Int64 {

let pathname: String = "./tmp6.txt"
var fs: FileStream = FileStream(pathname)
if (fs.openFile()) {
var bs: BufferStream = BufferStream(fs)
var toWrite:Array<UInt8> = @{66,67,68,69}
var toWrite2:Array<UInt8> = @{70,71,72}
bs.write(toWrite)
bs.flush()
bs.seek(0,SeekOrigin.CurPos)
bs.write(toWrite2)
bs.flush()
fs.close()
}

return 0

}
