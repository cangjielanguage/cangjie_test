// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("jjj.txt",OpenMode.Truncate)
    if (fs.openFile()){
        return 1
    }
    fs.close()
    return 0
}