// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}

class X{
    func test(){
        try{
            throw A()
            throw B()
        } catch (e:Exception){
            throw e
        } finally{
            return 4
        }
        return 3
    }
}


func main() {
    return try{
        X().test() - 4
    } catch (e:Exception){
        match (e) {
            case _ : A => 0
            case _ : B => 1
            case _ => -1
        }
    }
}
