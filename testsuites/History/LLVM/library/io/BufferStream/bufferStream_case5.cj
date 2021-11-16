// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: cat tmp5.txt| compare %f
// ASSERT: regex FBCDE
// EXEC: rm -rf tmp5.txt
import io.*

func main(): Int64 {

let pathname: String = "./tmp5.txt"
var fs: FileStream = FileStream(pathname)
if (fs.openFile()) {
var bs: BufferStream = BufferStream(fs)
var toWrite:Array<UInt8> = @{66,67,68,69}
var already:Array<UInt8> = @{70,70,70,70}
bs.write(already)
bs.flush()
bs.seek(-3,SeekOrigin.EndPos)
bs.write(toWrite)
bs.flush()
fs.close()
}

return 0

}
