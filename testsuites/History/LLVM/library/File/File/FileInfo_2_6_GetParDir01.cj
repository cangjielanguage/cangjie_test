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
    var src1_path = test_dir + "/" + "./test1.txt"
    var src2_path = test_dir + "/" + "../../test2.txt"
    var src3_path = test_dir + "/tmp/test3.txt"
    
    var src1: FileInfo = FileInfo(src1_path)
    if (!src1.Create())
    {
        deleteTestDirInPwd()
        return 1
    }
    var src2: FileInfo = FileInfo(src2_path)
    if (!src2.Create())
    {
        deleteTestDirInPwd()
        return 1
    }
    var src3: FileInfo = FileInfo(src3_path)
    if (!src3.Create())
    {
        deleteTestDirInPwd()
        return 1
    }
    
    
    if (src1.GetParentDirectory().GetPath() != test_dir + "/" + ".")
    {
        deleteTestDirInPwd()
        return 1
    }
    if (src2.GetParentDirectory().GetPath() != test_dir + "/" + "../..")
    {
        deleteTestDirInPwd()
        return 1
    }
    if (src3.GetParentDirectory().GetPath() != test_dir + "/tmp")
    {
        deleteTestDirInPwd()
        return 1
    }

    if (!src1.Delete() || !src2.Delete() || !src3.Delete())
    {
        deleteTestDirInPwd()
        return 1
    }

    if (!deleteTestDirInPwd()) {
        return 1
    }
    return 0
}
