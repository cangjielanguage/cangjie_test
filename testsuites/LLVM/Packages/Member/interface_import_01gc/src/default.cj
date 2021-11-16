// DEPENDENCE: p1
//EXEC: %compiler %cmp_opt  ./p1/*.cj -backend-options='-shared -fPIC' -o libp1.so
//EXEC: %compiler %cmp_opt %f -backend-options='-L. -lp1' -o %output
//EXEC: %run%run_opt %output %run_args

import p1.*

func main(): Int64 {
    var a = Stream()
    var b = MimeHeader().write(a)
    if ( b != 2 ) {
        print("${b}")
        return 1
    }
    return 0
}

class MimeHeader{
    func write(x:WriteStream):Int64{
        x.write("a")
    }
}
