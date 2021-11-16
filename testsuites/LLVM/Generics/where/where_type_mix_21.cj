// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: Range<Int32> & Object { // EXPECTED: regex error.*generic parameter 'T' cannot have class irrelevant upper bounds 'Record-String' and class upper bounds 'Class-Object' at the same time
    var a: T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<Range<Int32>>(0..2:1)
   if ( a.a != (0..2:1) ){
       return 1
   }
   return 0
}
