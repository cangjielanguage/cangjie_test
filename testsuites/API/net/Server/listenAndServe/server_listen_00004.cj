// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 99



from std import io.*
from std import net.*

func main(){
    var a = FuncHandler({x,y=>print("a!\n")})
    let s1 = Server(a)
    s1.port = 0
    for (i in 0..100){
        spawn{s1.listenAndServe()}
        print("${i}\n")
    }
    sleep(5000*1000*1000)

    return 0
}
