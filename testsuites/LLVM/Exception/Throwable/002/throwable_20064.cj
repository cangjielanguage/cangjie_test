// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A <: Throwable{}
class B <: A{}
class C <: A{}
class D <: Throwable{}

class X{
    func test(x:Int64){
        try{
            if (x == 1){throw B()}
            if (x == 2){throw C()}
            if (x == 3){throw D()}
        } catch (e:B|C|D){
            throw e
        } finally{
            return 4
        }
        return 3
    }
}


func main() {
    return try{
        X().test(1) - 4
    } catch (e:Exception){
        match (e) {
            case _ : A => 0
            case _ => -1
        }
    }
}
