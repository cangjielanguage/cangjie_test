// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("chaoda.txt",AccessMode.WriteOnly,OpenMode.Append)
    if (fs.openFile()){
        var toWrite = Array<UInt8>(80, 3)
        var res = fs.write(toWrite)
        fs.flush()
        fs.close()
        return 0
    }
    fs.close()
    return 0
}