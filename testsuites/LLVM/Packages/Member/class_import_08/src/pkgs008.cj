// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle 
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.classImport08

extend classImport08{
    func foo2(){
        return true
    }

    func foo3(){
        return 8
    }
}


func main(): Int64 {

    if(classImport08().foo2()){
        return classImport08().foo()-classImport08().foo3()
    }else{
        return 1
    }
}
    
