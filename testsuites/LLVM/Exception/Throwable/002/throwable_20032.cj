// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}

class B{
    var b_ = 0
    prop var b : Int64{
        get(){
            try{return b_}
            catch (_){return 2}
            finally{return 0}
        }
        set(v){
            try{this.b_ = v}
            catch (_){}
            finally{}
        }

    }
}

func main() {
    B().b = 0
    B().b
}
