// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I1{
    prop var size: Int64
}

interface I2{
    func getSize(): Int64
    func setSize(value: Int64): Unit
}

class C <: I1 & I2{
    private var mySize=0
    prop var size: Int64{
        get(){
            mySize
        }
        set(value){
            mySize= value
        }
    }
    func getSize(){
        mySize
    }
    func setSize(value: Int64){
        mySize= value
    }
}

func main(){
    let a: I1= C()
    a.size=5
    print("${a.size}\n")
    let b: I2= C()
    b.setSize(5)
    print("${b.getSize()}\n")
}
