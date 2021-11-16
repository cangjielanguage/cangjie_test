// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("./doc.txt",AccessMode.ReadWrite)
    if(fs.openFile()){
       fs.seek(6,SeekOrigin.BeginPos)
       var res = fs.seek(6,SeekOrigin.CurPos)
       fs.close()
       if (res==12){
        return 0
       }
       return 1
    }
    return 1
}