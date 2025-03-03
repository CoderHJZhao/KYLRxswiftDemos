//
//  KTVCacheManager.swift
//  kylRxMemoryDemo
//
//  Created by yulu kong on 2019/8/24.
//  Copyright © 2019 yulu kong. All rights reserved.
//

import UIKit
import WCDBSwift

class KTVCacheManager: NSObject {
    
    static let manager = KTVCacheManager()
    var database: Database
    let tableName = "KTVModelTable"
    override init() {
        // 沙盒路径
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last?.appendingPathComponent("lgcooci.db")
        // 创建数据库对象
        database = Database(withFileURL: path!)
        // 创建数据库表
        do {
            try database.create(table: tableName, of: KTVModel.self)
        } catch {
            print("建表失败")
        }
    }
    
    /// 增加数据
    func insertModelToTable(models:[KTVModel]) {
        do {
            try database.insert(objects: models, intoTable: tableName)
        } catch {
            print("添加失败")
        }
    }
    
    /// 更新数据
    func updataKTVModelData(model:KTVModel) {
        do {
            try database.update(table: tableName, on: KTVModel.Properties.isFinished, with: model, where: KTVModel.Properties.tittle == model.tittle)
        } catch  {
            print("更新数据失败")
        }
    }
    
    /// 删除数据
    func deleteKTVModelData(model:KTVModel) {
        do {
            try database.delete(fromTable: tableName,
                                where: KTVModel.Properties.tittle == model.tittle)
        } catch  {
            print("删除数据失败")
        }
    }
    
    /// 查找数据
    func fetachKTVModelData() -> [KTVModel]{
        var objects = [KTVModel]()
        do {
            objects = try database.getObjects(fromTable: tableName)
        } catch {
            print("查找数据失败")
        }
        return objects
    }
    
    /// 覆盖更新
    func updataAllData(models:[KTVModel]) {
        do {
            try database.delete(fromTable: tableName)
            self.insertModelToTable(models: models)
        } catch let error {
            debugPrint("delete error \(error.localizedDescription)")
        }
        
    }
    
    
}
