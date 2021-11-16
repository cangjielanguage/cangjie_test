// EXEC: echo "io=%libdir/io/cangjieIO.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: cat tmp4.txt| compare %f
// ASSERT: regex CCCC
// EXEC: rm -rf tmp4.txt

import io.*

func main(): Int64 {

let pathname: String = "./tmp4.txt"
var fs: FileStream = FileStream(pathname)
if (fs.openFile()) {
fs.seek(3,SeekOrigin.BeginPos)
var bs: BufferStream = BufferStream(fs,60000000000)
var toWrite:Array<UInt8> = {67,67,67,67}
bs.write(toWrite)
bs.flush()
fs.close()
}

return 0

}
