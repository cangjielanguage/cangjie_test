// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: rm doc1.txt

import io.*

func main(): Int64 {
    var fs1: FileStream = FileStream("./doc1.txt")
    fs1.openFile()
    var fs: FileStream = FileStream("doc1.txt",AccessMode.WriteOnly,OpenMode.Append)
    if (fs.openFile()){
        var ds:DataStream=DataStream(fs)
        var strWrite: String = "abcde"
        var writeBytes: Int64 = ds.writeLine(strWrite)
        ds.close()
        var fs2: FileStream = FileStream("doc1.txt",AccessMode.ReadWrite,OpenMode.Open)
        if (fs2.openFile()){
            var toRead = Array<UInt8>(20, 0)
            fs2.seek(0,SeekOrigin.CurPos)
            var res2=fs2.read(toRead,0,20)
            fs2.close()
            if (res2==6){
                return 0
            }
            return 1
        }
    }
    fs.close()
    return 1
}