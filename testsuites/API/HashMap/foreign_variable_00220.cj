// EXEC:%compiler %frontend -c %typecheck %stdx_cmp_opt %f

from std import collection.*
foreign let a : HashMap<Int32,Int32>
foreign var b : HashMap<Int32,Int32> =  HashMap<Int32,Int32>([(1,1)])

foreign{
    var c : HashMap<Int32,Int32>
    let d : HashMap<Int32,Int32> = HashMap<Int32,Int32>([(1,1)])
}
