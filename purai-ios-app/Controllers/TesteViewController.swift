import UIKit

class TesteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .dark

        createConstraints()
    }
    
    func createConstraints() {
        
        let subView = UIView()
        subView.backgroundColor = UIColor.red
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subView)
        
        let subViewTwo = UIView()
        subViewTwo.backgroundColor = UIColor.green
        subViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subViewTwo)
    }
}
