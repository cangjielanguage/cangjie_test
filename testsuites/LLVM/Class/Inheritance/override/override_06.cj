// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return Int64(Data.foo(3) - 3)
}

open class Base {
   static func foo(a: Int32): Int32 {
       return a
   }
}

open class Mid1 <: Base {

}

open class Mid2 <: Mid1 {

}

open class Mid3 <: Mid2 {

}

open class Mid4 <: Mid3 {

}

open class Mid5 <: Mid4 {

}

open class Mid6 <: Mid5 {

}

open class Mid7 <: Mid6 {

}

class Data <: Mid7{
   
}
