// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("./iii.txt",OpenMode.OpenOrCreate)
    if (fs.openFile()){
        if (fs.canRead()) {
            return 0
        }
        return 1
    }
    fs.close()
    return 2
}