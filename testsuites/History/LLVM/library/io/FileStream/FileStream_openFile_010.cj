// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("./doc.txt",AccessMode.ReadWrite)
    var toRead = Array<UInt8>(8, 0)
    if(fs.openFile()){
       var res = fs.read(toRead,1,8)
       Print(res)
       if(res==-1){
        return 0
       }
       return 1
    }
    return 1
}