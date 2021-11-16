// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.one as o
import pkgs.two as t
import pkgs.pi as p

func main(): Int64 {
    var a = o + t
    var b = p

    if(a==3 && b==3.1415){
        return 0
    }else{
        return 1
    }
}
