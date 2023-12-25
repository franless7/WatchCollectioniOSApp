//
//  BrandCollectionViewCell.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 24.12.2023.
//

import UIKit
import SDWebImage

class BrandCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "BrandCollectionViewCell"

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18,
                                 weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBrown
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        nameLabel.backgroundColor = .black
    }

    public func configure(with viewModel: BrandCollectionViewCellViewModel) {
        nameLabel.text = viewModel.brandName
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image?.sd_resizedImage(with: CGSize(width: self?.contentView.bounds.width ?? 150 , height: self?.contentView.bounds.height ?? 300), scaleMode: .aspectFill)
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
