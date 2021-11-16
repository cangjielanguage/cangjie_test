// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// EXEC: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("./doc.txt",AccessMode.ReadWrite)
    if(fs.openFile()){
       var toWrite=Array<UInt8>(8, 1)
       fs.write(toWrite)
       fs.flush()
       var res = fs.seek(-6,SeekOrigin.EndPos)
       fs.close()
       if(res==2){
        return 0
       }
    }
    return 1
}