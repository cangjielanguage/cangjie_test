// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args

package use

import define.*

interface A{
    @M1 prop var a:Int64 {
       get(){1}
       set(v){}
    }
}

class B{
    @M1 prop var a:Int64 {
       get(){1}
       set(v){}
    }
}

record C{
    @M1 prop var a:Int64 {
       get(){1}
       set(v){}
    }
}

enum D{e
    @M1 prop let a:Int64 {
       get(){1}
    }
}

func main(){0}