package test.memory

from std import sync.*


var ALLOC_UNIT_SIZE = 88;

// TODO: May modify due to runtime implement.
let LOCAL_MIN_IDX = 0
let LOCAL_MAX_IDX = 15
let GLOBAL_MIN_IDX = 16
let GLOBAL_MAX_IDX = 62

let LARGE_PAGE_SIZE = 4096
let PAGE_SIZE = 4016
let PAGE_HEADSIZE = 80

let OBJ_MAX_SIZE = 1008
let OBJ_HEADSIZE = 16

let LARGEOBJ_CHOSEN_NUM = 2
let LARGEOBJ_ALLOC_SIZE = 128 * LARGE_PAGE_SIZE
let MAX_REALIVE_OBJ_NUM = 1000



external open class AllocUnit{
    //var alloc_array : RefArray<Int8>
    var alloc_array : Array<Int8>

    AllocUnit(Length:Int64){
        alloc_array = Array<Int8>(Length,Int8(0))
    }
    init(){
        this(ALLOC_UNIT_SIZE)
    }
}


interface Runnable{
    func run():Unit
}

// TODO
open class Thread <: Runnable{
    var name : String
    var m : Runnable
    open func start(){
        print("start Thread ${name}!\n")
        return spawn {m.run()}
    }
    func run(){
        m.run()
    }
    init(target:Runnable, n:String){
        m=target
        name=n
    }
}


var mAllThread = ArrayList<Thread>()
// TODO: rely on java Thread.
class StopAbleThread <: Thread{
    // in java, we use ArraySet.
    private var mMutex = Mutex()
    init(m: Runnable, name: String){
        super(m, name)
    }


    private func recordThread(t:Thread) {
        synchronized (mMutex) {
            mAllThread.add(t)
        }
    }

    // TODO: isAlive in java. Used in android UI.
    private func removeDeadThread(){}
    // TODO: interrupt in java. Used in start_btn_interrupt_id.
    private func interruptAllThread(){}
    private func checkAllThreadExit(){}
    private func stopAllThread(){}
}


func alloc_byte_idx(bytesize_:Int64, idx:Int64, diff:Int64, isStress:Bool){
    var array : ArrayList<AllocUnit> = ArrayList<AllocUnit>()
    if (idx < LOCAL_MIN_IDX || idx > GLOBAL_MAX_IDX){
        throw Exception("idx < LOCAL_MIN_IDX || idx > GLOBAL_MAX_IDX")
    }
    var bytesize = pagesize_to_allocsize(bytesize_)
    var size_ : Int64 = idx_to_size(idx)
    if (size_ <= 0) {
        throw Exception("alloc_byte_idx size_ <= 0")
    }
    var sizenum = bytesize / size_
    if (sizenum == 0) {
        throw Exception("alloc_byte_idx sizenum == 0")
    }
    if (diff >= 0 || (sizenum + diff) > 0) {
        sizenum = sizenum + diff
    }
    for (i in 0..sizenum) {
        array.add(AllocOneUnit(size_, isStress))
    }
    return array
}



func alloc_byte_large(bytesize:Int64,alloc_size:Int64,diff:Int64,isStress:Bool){
    var array : ArrayList<AllocUnit> = ArrayList<AllocUnit>()
    if (alloc_size <= OBJ_MAX_SIZE) {
        throw Exception("alloc_size <= OBJ_MAX_SIZE")
    }
    var size : Int64 = 0
    if ((bytesize + diff * alloc_size) <= 0) {
        throw Exception("(bytesize + diff * alloc_size) <= 0")
    }
    var bytesize_ = bytesize + diff * alloc_size
    while (size < bytesize_) {
        size += alloc_size
        array.add(AllocOneUnit(alloc_size, isStress))
    }
    return array
}

var totalAllocedNum : Int64 = 0

// TODO: update me.
func AllocOneUnit(alloc_size:Int64,isStress:Bool){
    totalAllocedNum++
    var curNum : Int64 = totalAllocedNum % 100
    return AllocUnit(alloc_size);
}


func idx_to_size(idx:Int64){
    var ret : Int64 = 0
    if (idx < 0 || idx > GLOBAL_MAX_IDX) {
        print("[ERROR] alloc wrong idx in idx_to_size!\n")
        return 112 // why 112?
    }
    if (idx < GLOBAL_MAX_IDX) {
        ret = (idx+1)*8 + OBJ_HEADSIZE
    } else {
        // idx equals GLOBAL_MAX_IDX
        ret = OBJ_MAX_SIZE + OBJ_HEADSIZE;
    }
    return ret
}

func pagesize_to_allocsize(size:Int64){
    var ret : Int64 = 0
    var pagenum : Int64 = 0
    var size_ = size
    if ( size_ > (PAGE_SIZE + PAGE_HEADSIZE)) {
        pagenum = size_ / (PAGE_SIZE + PAGE_HEADSIZE)
        size_ = size_ - pagenum * (PAGE_SIZE + PAGE_HEADSIZE)
    }
    if (size_ < PAGE_SIZE) {
        ret = pagenum * PAGE_SIZE + size_
    } else {
        ret = pagenum * PAGE_SIZE + PAGE_SIZE;
    }
    return ret
}


// TODO: update me.
func alloc_choose_idx(size:Int64, range:ENUM_RANGE, chosen:Int64, prop_:Int64, random:Bool, isStress: Bool){
    var purpose = ArrayList<Int64>()
    var other = ArrayList<Int64>()
    var large_obj_list = ArrayList<Int64>()
    var array = ArrayList<AllocUnit>()
    var has_small = false
    var has_large = true
    if (!random){
        match (range){
            case ENUM_RANDOM_LOCAL =>
                purpose.addAll(choose_idx(LOCAL_MIN_IDX, GLOBAL_MIN_IDX, chosen, random))
                has_small = true
            case ENUM_RANGE_GLOBAL =>
                purpose.addAll(choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX + 1, chosen, random))
                has_small = true;
            case ENUM_RANGE_BOTH =>
                var chosen_ = chosen / 2
                purpose.addAll(choose_idx(LOCAL_MIN_IDX, GLOBAL_MIN_IDX, chosen_, random))
                other.addAll(choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX + 1, chosen_, random))
                has_small = true
            case ENUM_RANGE_LARGEOBJ =>
                large_obj_list.add(LARGE_PAGE_SIZE)
                large_obj_list.add(8 * LARGE_PAGE_SIZE)
                has_large = true
            case ENUM_RANGE_ALL =>
                var chosen_ = chosen / 2
                purpose.addAll(choose_idx(LOCAL_MIN_IDX, GLOBAL_MIN_IDX, chosen_, random))
                other.addAll(choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX + 1, chosen_, random))
                large_obj_list.add(LARGE_PAGE_SIZE)
                large_obj_list.add(8 * LARGE_PAGE_SIZE)
                has_small = true
                has_large = true
            case _ =>
                throw Exception("wrong range in alloc_choose_idx")
        }
    } else {
        // need random package
        ()
    }
    if (has_small) {
        array.addAll(alloc_choose_prop(purpose, other, prop_, size, 0, isStress))
    }
    if (has_large) {
        array.addAll(alloc_list_large(LARGEOBJ_ALLOC_SIZE, large_obj_list, 50, isStress))
    }
    return array
}

func makesureprop(p:Int64) {
    if (p > 100 || p <= 0) {
        return 100
    }
    return p
}

func alloc_choose_prop(purpose:ArrayList<Int64>,other:ArrayList<Int64>,prop_:Int64,size:Int64,diff:Int64,isStress:Bool){
    var p = makesureprop(prop_)
    var array = ArrayList<AllocUnit>()
    var size_alloc = 0
    var n_p = p / 10
    var n_o = (100 - p) / 100
    var no_alloc = true
    while (size_alloc < size) {
        for (i in 0..n_p) {
            //var it1 = purpose.iterator()
            //while(true){
            //    var a = it1.next()??-1
            //    if (a == -1){break}
            for (a in purpose){
                size_alloc += idx_to_size(a)
                var temp_array = alloc_byte_idx(idx_to_size(a), a, diff, isStress)
                array.addAll(temp_array)
                no_alloc = false
            }
            if (size_alloc > size) {
                return array
            }
        }
        for (i in 0..n_o) {
            //var it2 = other.iterator()
            //while (true) {
            //    var a = it2.next()??-1
            //    if (a == -1){break}
            for (a in other){
                size_alloc += idx_to_size(a)
                var temp_array = alloc_byte_idx(idx_to_size(a), a, diff, isStress)
                array.addAll(temp_array)
                no_alloc = false
            }
            if (size_alloc > size) {
                return array
            }
        }
        if (no_alloc) {
            return array
        }
    }
    return array
}

func alloc_list_large(bytesize: Int64, alloc_list:ArrayList<Int64>,prop_:Int64,isStress:Bool){
    var array = ArrayList<AllocUnit>()
    var size_allocated = 0
    var p = makesureprop(prop_)
    var n_p = p / 10
    var n_o = (100 - p) / 100
    while (size_allocated < bytesize) {
        var first = true
        var loopn = n_p
        if (alloc_list.size() == 0){
            return array
        }
        for (a in alloc_list){
            if (first) {
                loopn = n_p
                first = false
            } else{
                loopn = n_o
                first = true
            }
            for (i in 0..loopn){
                size_allocated += a
                var temp_array = alloc_byte_large(a,a,0,isStress)
                array.addAll(temp_array)
                if (size_allocated > bytesize){
                    return array
                }
            }
        }
    }
    return array
}


func choose_idx(min_:Int64,max_:Int64,chosen:Int64,random:Bool){
    if (min_ > max_){
        throw Exception("alloc wrong min&max in choose_idx")
    }
    var ret : ArrayList<Int64> = ArrayList<Int64>()
    if (!random){
        var grow = (max_ - min_ + chosen) / chosen
        for (i in min_..max_:grow){
            ret.add(i)
        }
    }else{
        // need random pkg.
        ()
    }
    return ret
}

func startAllThread(l:ArrayList<Thread>){
    var array = ArrayList<Future<Unit>>()
    for (i in l){
        var tmp = i.start()
        array.add(tmp)
        trySleep(5)
    }
    return array
}

func trySleep(t:Int64){
    sleep(t)
}

func waitAllThreadFinish(a:ArrayList<Future<Unit>>){
    for (f in a){
        try{
            f.getResult();
            ()
        } catch (_) {
            print("Exception in waitAllThreadFinish!")
        }
    }
}
