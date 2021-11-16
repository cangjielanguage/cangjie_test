// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("ddd.txt",AccessMode.ReadOnly)
    if (fs.openFile()) {
     var toRead = Array<UInt8>(80, 8)
     var res = fs.read(toRead,0,14)
     return 0
    }
    if (fs.canRead()) {
        return 0
    } else {
        return 1
    }
}