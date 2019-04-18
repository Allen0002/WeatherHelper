import UIKit

extension Date {
    static func getDateFromTimeStamp(_ timeStamp:Double) -> Date {
        return Date.init(timeIntervalSince1970: timeStamp)
    }
    
    func weekdayStringFromDate() -> String {
        let weekdays = ["Sun","Mon","Teu","Wen","Thu","Fri","Sat"]
        let calendar = Calendar.init(identifier: .gregorian)
        let components = calendar.dateComponents([.weekday], from: self)
        return weekdays[components.weekday! - 1]
    }
}

extension TimeInterval {
    func weekdayStringFromTimeStamp() -> String{
        return Date.getDateFromTimeStamp(self).weekdayStringFromDate()
    }
    
    func dateStringFromTimeStamp() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        return dateformatter.string(from: Date.getDateFromTimeStamp(self))
    }
}

extension UIView {
    func addSubViewFit(_ subView:UIView){
        subView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subView)
        let hvfl = "H:|-[subView]-|"
        let vvfl = "V:|-[subView]-|"
        let views = ["subView":subView]
        let hConsts = NSLayoutConstraint.constraints(withVisualFormat: hvfl, options: .alignAllLeft, metrics: nil, views: views)
        let vConsts = NSLayoutConstraint.constraints(withVisualFormat: vvfl, options: .alignAllLeft, metrics: nil, views: views)
        self.addConstraints(hConsts)
        self.addConstraints(vConsts)
    }
    
    static func initWithXib(_ name:String) -> UIView{
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        guard let view = views?[0], view is UIView  else {
            print("Can not load view with \(name) xib")
            return UIView()
        }
        return view as! UIView
    }
}
