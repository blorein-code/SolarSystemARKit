//
//  ViewController.swift
//  SolarSystemARKit
//
//  Created by Berke Topcu on 11.11.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let mySphere = createSphere(radius: 0.1, content: "wall.png", vector: SCNVector3(0, 0.2, -1))
        let mySphere2 = createSphere(radius: 0.1, content: "wood.png", vector: SCNVector3(0, 0.2, -2))
        let mySphere3 = createSphere(radius: 0.1, content: "stone.png", vector: SCNVector3(0.1, 0.3, -1))
        sceneView.scene.rootNode.addChildNode(mySphere)
        sceneView.scene.rootNode.addChildNode(mySphere2)
        sceneView.scene.rootNode.addChildNode(mySphere3)
    }
    
    func createSphere(radius:CGFloat, content:String, vector:SCNVector3) -> SCNNode {
        //Kutu oluşturuldu
       //let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        //Yuvarlak oluşturuldu.
        let mySphere = SCNSphere(radius: radius)
        
        //Box material olduğu belirtildi
       let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
        //Oluşturulan kutuya, oluşturulmuş olan boxmaterial verildi.
        //myBox.materials = [boxMaterial]
        mySphere.materials = [boxMaterial]
        
        let node = SCNNode()
        
        node.position = vector
        //oluşturduğumuz node'u şekil olarak verdik.
        //node.geometry = myBox
        node.geometry = mySphere
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
