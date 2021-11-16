// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import io.*


func main(): Int64 {
    var fs1: FileStream = FileStream("doc.txt",OpenMode.Truncate)
    fs1.openFile()
    var fs: FileStream = FileStream("doc.txt",AccessMode.WriteOnly, OpenMode.Append)
    if (fs.openFile()) {
        var ds: DataStream = DataStream(fs)
        var strWrite: String = "Hello, Char!"
        var writeBytes: Int64 = ds.writeLine(strWrite)
        ds.close()
        fs.close()
        var fs2: FileStream = FileStream("doc.txt",AccessMode.ReadOnly, OpenMode.Open)
        if (fs2.openFile()) {
            var ds2: DataStream = DataStream(fs2)
            ds2.seek(0, SeekOrigin.BeginPos)
            var strRead = ds2.readLine()
            ds2.close()
            if(strRead==strWrite){
                return 0
            }
            return 1
        }
    }
    return 2
}


