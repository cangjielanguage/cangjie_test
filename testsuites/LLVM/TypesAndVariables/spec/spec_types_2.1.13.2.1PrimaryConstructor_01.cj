// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Test{
    static let counter: Int64 = 3
    let name: String = "afdoaidfad"
    Test(
        name!: String,  // regular parameter
        annotation!: String = "nnn",  // regular parameter
        var width!: Int64 = 1,  // member variable parameter with initial value
        private var length!: Int64 ,  // member variable parameter
        private var height!: Int64 = 3  // member variable parameter
   ) 
   {
   print("${name}\n")
   print("${width}\n")
   print("${length}\n")
   }
   
}

func main(){
        var t = Test(name:"w",annotation:"w",width:1,length:2,height:3)   
        return 0
}

