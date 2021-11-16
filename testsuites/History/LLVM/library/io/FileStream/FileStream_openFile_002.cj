// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import io.*

func main(): Int64 {
var fs2: FileStream = FileStream("")
    if (fs2.openFile()) {
        return 1
    } else {
        return 0
    }
}