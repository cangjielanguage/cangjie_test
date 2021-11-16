// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.classImport07

class Boo<T>{
    var value = 2
}

func main(): Int64 {
    
    if (Boo<classImport07>().value == 2){
        return 0
    }else{
        return 1
    }
}
