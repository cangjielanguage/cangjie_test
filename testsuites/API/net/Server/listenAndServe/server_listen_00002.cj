// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan z is 2!
// ASSERT: scan-not Log-Err


from std import io.*
from std import net.*

var z = 0

func main(){
    var a = FuncHandler({x,y=> z+=1;print("z is ${z}!\n")})
    let s1 = Server(a)
    s1.port = 11001
    spawn{s1.listenAndServe()}
    sleep(100*1000*1000)

    s1.port = 11002
    spawn{s1.listenAndServe()}
    sleep(100*1000*1000)
    var c = Client()
    sleep(1000*1000*1000)
    c.get("http://0.0.0.0:11001")
    c.get("http://0.0.0.0:11002")
    return 0
}
