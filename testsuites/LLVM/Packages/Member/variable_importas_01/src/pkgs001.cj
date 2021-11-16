// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.one as o
import pkgs.two as t
import pkgs.pi as p

func main(): Int64 {
    func varAs(a:Int32,b:Float32):Int32{
        if(a==1 && b == 3.1415) {
            return t-2
        }else{
            return 1
        }
    }

    return Int64(varAs(o,p))
}
