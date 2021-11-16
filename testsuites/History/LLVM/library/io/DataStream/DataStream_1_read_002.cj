// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args
import io.*


func main(): Int64 {
    var fs1: FileStream = FileStream("doc.txt",OpenMode.Truncate)
    fs1.openFile()
    var fs: FileStream = FileStream("doc.txt", AccessMode.ReadWrite, OpenMode.OpenOrCreate)
    if (fs.openFile()) {
        var ds: DataStream = DataStream(fs)
        var strWrite: String = "aaa"
        var writeBytes: Int64 = ds.writeLine(strWrite)
        ds.seek(0, SeekOrigin.BeginPos)
        var strRead = ds.readLine()
        ds.close()
        fs.close()
        if (strRead == "aaa") {
            return 0
        }
        return 1
    }
    return 2
}


