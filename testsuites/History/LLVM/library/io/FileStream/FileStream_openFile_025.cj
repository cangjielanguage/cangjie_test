// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("doc.txt",AccessMode.WriteOnly,OpenMode.Append)
    if (fs.openFile()){
        var ds:DataStream=DataStream(fs)
        var strWrite: String = "abcde"
        var writeBytes: Int64 = ds.writeLine(strWrite)
        ds.flush()
        ds.close()
        var fs2: FileStream = FileStream("doc.txt",OpenMode.Truncate)
        if (fs2.openFile()){
            var toRead = Array<UInt8>(20, 0)
            fs2.seek(0,SeekOrigin.CurPos)
            var res2=fs2.read(toRead,0,20)
            fs2.close()
            if (res2==0){
                return 0
            }
            return 1
        }
        return 0
    }
    fs.close()
    return 1
}