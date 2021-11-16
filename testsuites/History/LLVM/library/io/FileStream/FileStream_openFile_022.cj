// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: echo "abcde" > doc.txt
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("doc.txt",OpenMode.Open)
    if (fs.openFile()){
        return 0
    }
    fs.close()
    return 1
}