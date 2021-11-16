// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

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

class Data2{
     var a:Int32
     init(){    // EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
         if(true){
             a=1
         }else{
             var x=0
         }
     }
}

func main():Int64 {
    var data1 = Data()
    var data2 = Data2()
    return 0
}