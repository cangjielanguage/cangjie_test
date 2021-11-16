// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("eee.txt",AccessMode.ReadWrite)
    if (fs.openFile()){
        var toWrite = Array<UInt8>(80, 8)
        var res = fs.write(toWrite,0,15)
        fs.flush()
        var toRead = Array<UInt8>(80, 8)
        var res1 = fs.write(toRead,0,15)
        fs.close()
        return 0
    }
    return 1
}