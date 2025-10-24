// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class Main {

    public static void main(String[] args) {
        System.out.println("JAVA: start");
        var i = new Impl();
        i.f();
        i.g();
        System.out.println("JAVA: end");
    }
}