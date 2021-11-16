// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data{
     var a:Int32
     init(){
         if(true){
             a=1
         }else{
             a=2
         }
     }
}

func main():Int64 {
    var data1 = Data()
    if (data1.a ==1) {
        return 0
    }
    return 1
}