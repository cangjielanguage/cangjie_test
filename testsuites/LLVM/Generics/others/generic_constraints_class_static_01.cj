// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( A<String>.a != "123" ){
        return 1
    }
    if ( B<String>().a != "123" ){
        return 2
    }
    if ( C<Base>().a != "abc" ){
        return 2
    }
    return 0
}

class B<T> where T <: String{
   var b: String = ""
   var arr1 = ["1","23"]
   prop let a:String{
       get(){
           return T.join(arr1)
       }
   }
}

class A<T> where T <: String{
   static var b: String = ""
   static var arr1 = ["1","23"]
   static prop let a:String{
       get(){
           return T.join(arr1)
       }
   }
}

class C<T> where T <: Base{
   prop let a:String{
       get(){
           return T.foo()
       }
   }
}

open class Base{
    static func foo(){ return "abc" }
}