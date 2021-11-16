// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC： ls -l

from std import io.*
from std import log.*

func main(){
   var fs:SubFile = SubFile("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
   fs.openFile()
   let logger: SimpleLogger = SimpleLogger()
   logger.setOutput(fs)
   fs.flush()
   fs.close()
    0
}
class SubFile <: FileStream {
     init(pn: String, am: AccessMode, om: OpenMode) {
            super(pn, am, om, false)
        }
}