import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldWeight: UITextField!
    @IBOutlet weak var textFieldHeight: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var viewResults: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func buttonCalculate(_ sender: UIButton) {
        if let weight = Double(textFieldWeight.text!), let height = Double(textFieldHeight.text!){
             imc = weight / (height*height)
            showResults()
        }
    }
    
    func showResults(){
        var results = ""
        var image = ""
        
        switch imc {
        case 0..<16:
            results = "Magreza"
            image = "abaixo"
        case 16..<18.5:
            results = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            results = "Peso ideal"
            image = "ideal"
        case 25..<30:
            results = "Sobrepeso"
            image = "sobre"
        default:
            results = "Obesidade"
            image = "obesidade"
        }
        
        view.endEditing(true)
        viewResults.isHidden = false
        labelResult.text = "\(Int(imc)): \(results)"
        imageViewResult.image = UIImage(named: image)
    }
}

