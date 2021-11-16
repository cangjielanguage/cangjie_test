// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("./doc.txt",AccessMode.ReadWrite)
    if(fs.openFile()){
       var res = fs.seek(6,SeekOrigin.BeginPos)
       fs.close()
       if (res==6){
        return 0
       }
       return 1
    }
    return 1
}