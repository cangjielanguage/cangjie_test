// DEPENDENCE: black1.txt
// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args
// EXEC: %ls -l


from std import io.*
from std import log.*

func main(){
    var fs:FileStream = FileStream("black1.txt",AccessMode.WriteOnly, OpenMode.Append)
    fs.openFile()
    var str="中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中中"
    let logger: SimpleLogger = SimpleLogger(str,LogLevel.ALL,fs)
    var n=0..100
    for(i in n)
    {
        logger.trace(str)
    }
    fs.flush()
    fs.close()
    0
}
