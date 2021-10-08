//
//  CollectionViewController.swift
//  Collection and Scroll views
//
//  Created by Anvarjon Khojimatov on 2021/10/07.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    var items: Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inintViews()
    }
    //MARK: - Methods
    
    func inintViews() {
        addNavigatinBar()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(image: "image1", title: "Best Coding"))
        items.append(Item(image: "image2", title: "Amazing Code"))
        items.append(Item(image: "image1", title: "Best Coding"))
        items.append(Item(image: "image2", title: "Amazing Code"))
        items.append(Item(image: "image1", title: "Best Coding"))
        items.append(Item(image: "image2", title: "Amazing Code"))
        items.append(Item(image: "image1", title: "Best Coding"))
        items.append(Item(image: "image2", title: "Amazing Code"))
        items.append(Item(image: "image1", title: "Best Coding"))
        items.append(Item(image: "image2", title: "Amazing Code"))
        items.append(Item(image: "image1", title: "Best Coding"))
        items.append(Item(image: "image2", title: "Amazing Code"))
        
    }
    
    func addNavigatinBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_scroll"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(scrollTapped))
        
        title = "Collection View"
        
        }
    
    
    func callScrollController() {
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true    )
    }
    
    //MARK: - Actions
    
    @objc func scrollTapped() {
        callScrollController()
    }
    
    //MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.LabelCell.text = item.title
        cell.imageViewCell.image = UIImage(named: item.image!)
        
        
        return cell
    }


    

}
