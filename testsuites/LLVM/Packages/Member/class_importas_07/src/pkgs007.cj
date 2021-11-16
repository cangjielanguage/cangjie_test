// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.classImport07 as class07

class Boo{
    
}

func main(): Int64 {
    
    if (class07<Boo>().value == 2){
        return 0
    }else{
        return 1
    }
}
