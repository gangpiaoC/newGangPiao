//
//  UserCell.swift
//  test
//
//  Created by gangpiaowang on 2016/12/16.
//  Copyright © 2016年 mutouwang. All rights reserved.
//

import UIKit

class UserTopCell: UITableViewCell {
    
    var superController:UIViewController?
    
    //用户手机号
    var phoneLabel:UILabel!
    
    //收益
    var everyAddMoneyLabel:UILabel!
    
    //资金总额
    var acountMoneyLabel:UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        let userImgView = UIImageView(frame: CGRect(x: 16, y: pixw(p: 35), width: 31, height: 31))
        userImgView.image = UIImage(named: "user_center_toplogo")
        contentView.addSubview(userImgView)
        
        phoneLabel = UILabel(frame: CGRect(x: userImgView.maxX + 8,y:  0,width: 200,height:  pixw(p: 15)))
        phoneLabel.text = "***********"
        phoneLabel.font = UIFont.customFont(ofSize: 16)
        phoneLabel.centerY = userImgView.centerY
        phoneLabel.textColor = UIColor.white
        self.contentView.addSubview(phoneLabel)
        
        let  userInfoBtn = UIButton(type: .custom)
        userInfoBtn.frame = CGRect(x: userImgView.x, y: userImgView.y, width: phoneLabel.maxX - userImgView.x, height: userImgView.height)
        userInfoBtn.tag = 103
        userInfoBtn.addTarget(self, action: #selector(self.setClick(_:)), for: .touchUpInside)
        contentView.addSubview(userInfoBtn)
        
        let temp1Label = UILabel(frame: CGRect(x: 0,y: userImgView.maxY + pixw(p: 31),width: SCREEN_WIDTH / 2,height:  pixw(p: 16)))
        temp1Label.text = "资金总额(元)"
        temp1Label.font = UIFont.customFont(ofSize: 16)
        temp1Label.textColor = UIColor.white
        temp1Label.textAlignment = .center
        self.contentView.addSubview(temp1Label)
        
        acountMoneyLabel = UILabel(frame:CGRect(x: 0,y: temp1Label.maxY +  pixw(p: 6),width: temp1Label.width,height:  pixw(p: 30)))
        acountMoneyLabel.text = "0.00"
        acountMoneyLabel.font = UIFont.systemFont(ofSize: 28)
        acountMoneyLabel.textColor = UIColor.white
        acountMoneyLabel.textAlignment = .center
        self.contentView.addSubview(acountMoneyLabel)
        
        
        let temp2Label = UILabel(frame: CGRect(x: SCREEN_WIDTH / 2 - 30,y: temp1Label.y,width: SCREEN_WIDTH / 2,height:  pixw(p: 16)))
        temp2Label.text = "累计收益(元)"
        temp2Label.font = UIFont.customFont(ofSize:  16)
        temp2Label.textColor = UIColor.white
        temp2Label.textAlignment = .center
        self.contentView.addSubview(temp2Label)
        
        everyAddMoneyLabel = UILabel(frame:CGRect(x: temp2Label.x,y: acountMoneyLabel.y,width: SCREEN_WIDTH / 2,height:  pixw(p: 30)))
        everyAddMoneyLabel.text = "0.00"
        everyAddMoneyLabel.font = UIFont.systemFont(ofSize:  28)
        everyAddMoneyLabel.textColor = UIColor.white
        everyAddMoneyLabel.textAlignment = .center
        self.contentView.addSubview(everyAddMoneyLabel)
        
        let  rightImgView = UIImageView(frame: CGRect(x: SCREEN_WIDTH - 16 - 8, y: temp1Label.maxY, width: 8, height: 16))
        rightImgView.image = UIImage(named:"user_center_topright")
        contentView.addSubview(rightImgView)
        
        let acoutMBtn = UIButton(type: .custom)
        acoutMBtn.frame = CGRect(x: 0, y: temp1Label.y , width: SCREEN_WIDTH, height: everyAddMoneyLabel.maxY - temp1Label.y)
        acoutMBtn.tag = 102
        acoutMBtn.addTarget(self, action: #selector(self.setClick(_:)), for: .touchUpInside)
        self.contentView.addSubview(acoutMBtn)
        
    }
    
    func updata(_ everyAddMoney:String,acountMoney:String,phone:String,superC:UIViewController) {
        if everyAddMoney == "****" || acountMoney == "****"{
             self.everyAddMoneyLabel.text = everyAddMoney
            self.acountMoneyLabel.text = acountMoney
            return
        }
        let  tempformat = NumberFormatter()
        tempformat.numberStyle = .decimal
        let doubleNum = tempformat.number(from: everyAddMoney)
        self.everyAddMoneyLabel.changNum(toNumber: doubleNum as! Double, withDurTime: 1)
        let  tempformat1 = NumberFormatter()
        tempformat1.numberStyle = .decimal
        let double1Num = tempformat1.number(from: acountMoney)
        self.acountMoneyLabel.changNum(toNumber:double1Num as! Double , withDurTime: 1)
        self.phoneLabel.text = phone
        self.superController = superC
    }
    
    func setClick(_ sender:UIButton) {
        if sender.tag == 102 {
            MobClick.event("mine", label: "资金统计")
            superController?.navigationController?.pushViewController(GPWUserMoneyFundViewController(), animated: true)
        }else if sender.tag == 103 {
             superController?.navigationController?.pushViewController(UserSetViewController(), animated: true)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}