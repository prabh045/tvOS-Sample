//
//  DemoUIController.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 11/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit
import AVKit

class DemoUIController: UIViewController {
    
    let sectionInsets = UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
    var isDiscriptionExpanded = false {
        didSet {
            if isDiscriptionExpanded == true{
                descriptionLabel.numberOfLines = 0
            } else {
                descriptionLabel.numberOfLines = 3
            }
        }
    }
    
    lazy var descriptionStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Avenges: Infinity War"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie | Wow | Drama | Epic"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Avengers: Infinity War is a 2018 American superhero film based on the Marvel Comics superhero team the Avengers, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures\n\nHaving acquired the Power Stone, one of the six Infinity Stones, from the planet Xandar, Thanos and his lieutenants—Ebony Maw, Cull Obsidian, Proxima Midnight, and Corvus Glaive—intercept the spaceship carrying the survivors of Asgard's recent destruction.As they extract the Space Stone from the Tesseract, Thanos subdues Thor, overpowers Hulk, and kills Loki. Thanos also kills Heimdall after he sends Hulk to Earth using the Bifröst. Thanos and his lieutenants leave, destroying the ship."
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 3
        /// label.isFocused
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "infinitywar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var optionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DemoTableViewCell.self, forCellReuseIdentifier: DemoTableViewCell.identifier)
        //        tableView.estimatedRowHeight = 50
        //        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var mediaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DemoCell.self, forCellWithReuseIdentifier: DemoCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstrains()
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            optionsTableView.heightAnchor.constraint(equalToConstant: optionsTableView.contentSize.height)
        ])
    }
    
    private func setupUI() {
        self.view.addSubview(descriptionStack)
        descriptionStack.addArrangedSubview(titleLabel)
        descriptionStack.addArrangedSubview(subtitleLabel)
        descriptionStack.addArrangedSubview(descriptionLabel)
        self.view.addSubview(posterImage)
        self.view.addSubview(optionsTableView)
        self.view.addSubview(mediaCollectionView)
    }
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(expandDescription))
        tap.numberOfTapsRequired = 1
        descriptionLabel.addGestureRecognizer(tap)
    }
    
    private func setupConstrains() {
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            descriptionStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            descriptionStack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            descriptionStack.trailingAnchor.constraint(equalTo: posterImage.leadingAnchor,constant: -10),
            
            posterImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            posterImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            optionsTableView.leadingAnchor.constraint(equalTo: descriptionStack.leadingAnchor),
            optionsTableView.topAnchor.constraint(equalTo: descriptionStack.bottomAnchor),
            optionsTableView.trailingAnchor.constraint(equalTo: descriptionStack.trailingAnchor),
            
            mediaCollectionView.topAnchor.constraint(equalTo: optionsTableView.bottomAnchor),
            //            mediaCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.30),
            mediaCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mediaCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mediaCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -10)
        ])
        
    }
    
    @objc func expandDescription() {
        isDiscriptionExpanded = !isDiscriptionExpanded
    }
}
//MARK: Collection View
extension DemoUIController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DemoCell.identifier, for: indexPath) as? DemoCell else {
            fatalError()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let url = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4") else { return }
//        let playerLayer: AVPlayerLayer?
//        let trailerPlayer = AVPlayer(url: url)
//        playerLayer = AVPlayerLayer(player: trailerPlayer)
//        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
//
//        playerLayer?.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer!)
//        trailerPlayer.play()
//        self.view.layer.insertSublayer(playerLayer!, at: 0)
        
//        let videoURL = URL(string: "https://www.dropbox.com/s/df2d2gf1dvnr5uj/Sample_1280x720_mp4.mp4")
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()
        
    }
}

extension DemoUIController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = sectionInsets.left * (5 + 1)
        let availableWidth = collectionView.frame.width - padding
        let widthPerItem = availableWidth / 5
        return CGSize(width: widthPerItem, height: collectionView.frame.size.height-(sectionInsets.top + sectionInsets.bottom)-10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}

//MARK: TableView
extension DemoUIController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DemoTableViewCell.identifier, for: indexPath) as? DemoTableViewCell else {
            fatalError()
        }
        return cell
    }
}
