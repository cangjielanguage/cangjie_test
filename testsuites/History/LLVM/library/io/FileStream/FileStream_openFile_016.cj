// EXEC: echo "io=%libdir/io/io.cjo" > io.cfg
// ERRCHECK: %compiler -i io.cfg %libdir/io/cangjieIO.o %f -o %output

import io.*

func main(): Int64 {
    var fs: FileStream = FileStream("./bbb.txt",AccessMode.ReadWrite)
    if(fs.openFile()){
       var toWrite = Array<UInt8>(80, 999) // EXPECTED: regex the number '999' exceeds the value range of type 'UInt8'
       var res = fs.write(toWrite,2,15)
       fs.flush()
       fs.close()
       if(res==15){
        return 0
       }
    }
    return 1
}