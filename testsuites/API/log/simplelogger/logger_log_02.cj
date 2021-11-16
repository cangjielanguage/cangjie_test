// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import io.*
from std import log.*

func main(){
   let logger: SimpleLogger = SimpleLogger()
   var fs = FileStream("black1.txt", AccessMode.WriteOnly, OpenMode.Append)
   fs.openFile()
   logger.setOutput(fs)
   logger.setLevel(LogLevel.ALL)
   logger.log(LogLevel.ABS,"======打印OFF的msg========") //EXPECTED: regex-auto 'ABS' is not a member of enum 'LogLevel'
   fs.flush()
   fs.close()
   0
}

