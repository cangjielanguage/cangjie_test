// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args

from os import os.*
from io import io.*

var pwd_path: String = Directory.GetWorkingDirectory().GetCanonicalPath()
var test_path0 = pwd_path + "/test0"
var nameCnt: Int64 = 0;
var testPathBaseLength = pwd_path.size() + 5
let nameCntLimit = 15;
let maxPathLength = 512

func tryNewName() {
    if ("${nameCnt}".size() < nameCntLimit) {
        test_path0 = test_path0.substring(0, testPathBaseLength) + "_${nameCnt}"
        nameCnt = nameCnt + 1
        return
    }
    nameCnt = 0
    testPathBaseLength = testPathBaseLength + nameCntLimit
    return
}

func createAndGetTestDirInPwd(): String {
    while (Directory.Exist(test_path0) && test_path0.size() < maxPathLength) {
        tryNewName()
    }
    if (test_path0.size() >= maxPathLength) {
        return ""
    }
    var test_path1 = test_path0 + "/test1"
    var test_path2 = test_path1 + "/test2"
    var test_path3 = test_path2 + "/test3"
    var test_path_tmp = test_path3 + "/tmp"

    if (!Directory.Create(test_path0)) { return "" }
    if (!Directory.Create(test_path1)) { return "" }
    if (!Directory.Create(test_path2)) { return "" }
    if (!Directory.Create(test_path3)) { return "" }
    if (!Directory.Create(test_path_tmp)) { return "" }
    return test_path3
}

func deleteTestDirInPwd(): Bool {
    if (!Directory.Delete(test_path0, true)) { return false }
    if (Directory.Exist(test_path0)) { return false }
    return true
}

func main(): Int64{
    var test_dir: String = createAndGetTestDirInPwd()
    if (test_dir.size() <= 0) {
        if (test_path0.size() >= maxPathLength) {
            return 1
        }
        if (Directory.Exist(test_path0)) {
            deleteTestDirInPwd()
        }
        return 1
    }
    //当前路径
    var src1_path = test_dir + "/tmp/test1.txt"
    var des1_path = test_dir + "/tmp/test2.txt"
        
    var src2_path = test_dir + "/tmp/test3.txt"
    var des2_path = test_dir + "/tmp/test4.txt"
    
    var src3_path = test_dir + "/tmp/test5.txt"
    var des3_path = test_dir + "/tmp/test5.txt"
    
    // Round 1
    var src1: FileInfo = FileInfo(src1_path)
    if (!src1.Create())
    {
        deleteTestDirInPwd()
        return 1
    }
    var des1: FileInfo = src1.CopyTo(des1_path,true)
    if (!src1.Exist() || !des1.Exist())
    {
        deleteTestDirInPwd()
        return 1
    }
    
    // Round 2
    var src2: FileInfo = FileInfo(src2_path)
    if (!src2.Create())
    {
        deleteTestDirInPwd()
        return 1
    }
    var des2: FileInfo = src1.CopyTo(des2_path,false)
    if (!src2.Exist() || !des2.Exist())
    {
        deleteTestDirInPwd()
        return 1
    }    
    
    // Round 3
    var src3: FileInfo = FileInfo(src3_path)
    if (!src3.Create())
    {
        deleteTestDirInPwd()
        return 1
    }
    var des3: FileInfo = src3.CopyTo(des3_path,true)
    if (!des3.Exist())
    {
        deleteTestDirInPwd()
        return 1
    }
    
    //Delete
    if (!src1.Delete() || !des1.Delete() || !src2.Delete() || !des2.Delete() || !des3.Delete())
    {
        deleteTestDirInPwd()
        return 1
    }
    if (!deleteTestDirInPwd()) {
        return 1
    }
    return 0
}
