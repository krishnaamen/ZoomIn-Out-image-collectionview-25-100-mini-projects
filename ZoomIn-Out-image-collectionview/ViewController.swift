//
//  ViewController.swift
//  ZoomIn-Out-image-collectionview
//
//  Created by Macbook on 12/07/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var imgArray = [#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a1"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2"),#imageLiteral(resourceName: "a2")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageInfo = GSImageInfo(image: imgArray[indexPath.row], imageMode: .aspectFit)
        let transitionInfo = GSTransitionInfo(fromView: collectionView)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
        imageViewer.dismissCompletion = {
            print("dissmiss called")
        }
        present(imageViewer,animated: true)
    }


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.img.layer.borderWidth = 1
        cell.img.layer.masksToBounds = false
        cell.img.layer.borderColor = UIColor.black.cgColor
        cell.img.layer.cornerRadius = cell.img.frame.height
        cell.img.clipsToBounds = true
        cell.img.image = imgArray[indexPath.row]
        return cell
        
    }
    
    
}
