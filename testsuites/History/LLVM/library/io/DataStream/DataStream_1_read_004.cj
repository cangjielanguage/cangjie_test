// EXEC: echo "io=%libdir/io/cangjieIO.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import io.*


func main(): Int64 {
    var fs1: FileStream = FileStream("gbk.txt",OpenMode.Truncate)
    fs1.openFile()
    var fs: FileStream = FileStream("gbk.txt", AccessMode.ReadWrite, OpenMode.Open)
    if (fs.openFile()) {
        var ds: DataStream = DataStream(fs)
        ds.seek(0, SeekOrigin.EndPos)
        var strWrite: String = "你好Hello, Char!"
        var writeBytes: Int64 = ds.writeLine(strWrite)
        Print("writeBytes: "+writeBytes.toString())
        ds.seek(-15, SeekOrigin.CurPos)
        var strRead = ds.readLine()
        ds.flush()
        ds.close()
        Print(strRead)
        if (strRead=="你好Hello, Char!"){
            return 0
        }
        return 1
    }
    return 1
}


