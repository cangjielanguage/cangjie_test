// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.classImport08 as class08

extend class08{
    func foo2(){
        return true
    }

    func foo3(){
        return 8
    }
}


func main(): Int64 {

    if(class08().foo2()){
        return class08().foo()-class08().foo3()
    }else{
        return 1
    }
}
    
