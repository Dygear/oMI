//
//  ViewController.swift
//  oMI
//
//  Created by Mark Tomlin on 18-10-14.
//  Copyright © 2018 MimoCAD, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Sex: UISegmentedControl!
    @IBOutlet weak var QTc: UITextField!
    @IBOutlet weak var V2J: UITextField!
    @IBOutlet weak var V3J: UITextField!
    @IBOutlet weak var V4J: UITextField!
    @IBOutlet weak var V2R: UITextField!
    @IBOutlet weak var V3R: UITextField!
    @IBOutlet weak var V4R: UITextField!
    @IBOutlet weak var resultText: UILabel!
    @IBAction func onButtonPress(_ sender: Any) {
        let floatQTc = Double(QTc.text!) ?? 0.00
        let floatV2J = Double(V2J.text!) ?? 0.00
        let floatV3J = Double(V3J.text!) ?? 0.00
        let floatV4J = Double(V4J.text!) ?? 0.00
        let intV2R = Double(V2R.text!) ?? 0.00
        let intV3R = Double(V3R.text!) ?? 0.00
        let intV4R = Double(V4R.text!) ?? 0.00

        let STJMean = floatV2J + floatV3J + floatV4J / 3
        let RWHMean =   intV2R +   intV3R +   intV4R / 3
        let Result  = ((1.553 * STJMean) + (0.0546 * floatQTc) - (0.3813 * RWHMean))

        if (Result > 21) {
            resultText.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            resultText.text = "\(Double(round(100 * Result) / 100)) Postive Anterior MI (+LAD Occlusion Until Proven Otherwise)."
        } else {
            resultText.textColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            resultText.text = "\(Double(round(100 * Result) / 100)) Unlikely Anterior MI"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
