// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan already in use



from std import io.*
from std import net.*

func main(){
    var a = FuncHandler({x,y=>print("a!\n")})
    var b = FuncHandler({x,y=>print("b!\n")})
    let s1 = Server(a)
    s1.port = 11001
    spawn{s1.listenAndServe()}
    sleep(100*1000*1000)

    let s2 = Server(b)
    s2.port = 11001
    spawn{s2.listenAndServe()}
    sleep(100*1000*1000)
    var c = Client()
    c.get("http://0.0.0.0:11001")
    s1.close()
    s2.close()
    return 0
}