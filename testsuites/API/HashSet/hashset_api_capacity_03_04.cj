// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var r2:HashSet<String> = HashSet<String>(["a","b","c"])
    var r4:HashSet<String> = HashSet<String>(3)
    r2.reserve(2)
    if (r2.capacity()!=16){   //扩容后不超过16
       return 1
    }
    r2.reserve(11)
    if (r2.capacity()!=16){   //扩容后等于16
       return 2
    }
    r2.reserve(1)
    if (r2.capacity()!=16){   //扩容后大于16
       return 3
    }
    r2.reserve(32)
    if (r2.capacity()!=64){   //扩容后大于32，越过一个容量倍数
       return 4
    }
    r4.reserve(2)
    if (r4.capacity()!=16){   //扩容后不超过16
       return 5
    }
    r4.reserve(11)
    if (r4.capacity()!=16){   //扩容后等于16
       return 6
    }
    r4.reserve(1)
    if (r4.capacity()!=16){   //扩容后大于16
       return 7
    }
    r4.reserve(32)
    if (r4.capacity()!=32){   //扩容后大于32，越过一个容量倍数
       return 8
    }
     print("success1\n")
    return 0
}
