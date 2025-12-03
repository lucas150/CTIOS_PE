//
//  CarouselView.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 01/12/25.
//

import UIKit

public class CarouselView: UIView,
                    UICollectionViewDataSource,
                    UICollectionViewDelegateFlowLayout,
                    UIScrollViewDelegate {

    // PUBLIC API
    public var items: [CarouselItem] = [] {
        didSet { prepareInfiniteItems() }
    }

    public var autoScrollInterval: TimeInterval = 3.0

    // INTERNAL
    private var infiniteItems: [CarouselItem] = []
    private var autoTimer: Timer?
    private var autoIndex = 1
    private var isAutoScrolling = false

    private var collectionView: UICollectionView!

    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }

    // MARK: - Setup
    private func setupCollectionView() {
        let layout = CarouselFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "CarouselCell")

        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    // MARK: - Infinite Data
    private func prepareInfiniteItems() {
        guard items.count > 1 else {
            infiniteItems = items
            collectionView.reloadData()
            return
        }

        infiniteItems = []
        infiniteItems.append(items.last!)      // ghost left
        infiniteItems.append(contentsOf: items)
        infiniteItems.append(items.first!)     // ghost right

        collectionView.reloadData()

        DispatchQueue.main.async {
            self.collectionView.scrollToItem(
                at: IndexPath(item: 1, section: 0),
                at: .centeredHorizontally,
                animated: false
            )
        }
    }

    // MARK: - Auto Scroll
    public func startAutoScroll() {
        autoTimer?.invalidate()
        autoTimer = Timer.scheduledTimer(withTimeInterval: autoScrollInterval, repeats: true) { [weak self] _ in
            self?.scrollToNext()
        }
    }

    public func stopAutoScroll() {
        autoTimer?.invalidate()
    }

    private func scrollToNext() {
        guard infiniteItems.count > 1 else { return }

        isAutoScrolling = true
        autoIndex += 1

        if autoIndex == infiniteItems.count - 1 {
            // scroll to ghost-right
            collectionView.scrollToItem(at: IndexPath(item: autoIndex, section: 0),
                                        at: .centeredHorizontally, animated: true)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                self.autoIndex = 1
                self.jumpTo(index: 1)
            }
            return
        }

        collectionView.scrollToItem(at: IndexPath(item: autoIndex, section: 0),
                                    at: .centeredHorizontally, animated: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
            self.isAutoScrolling = false
        }
    }

    // MARK: - Jump Logic
    private func jumpTo(index: Int) {
        isAutoScrolling = true
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                    at: .centeredHorizontally, animated: false)
        DispatchQueue.main.async { self.isAutoScrolling = false }
    }

    // MARK: - Scroll Delegates
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        adjustInfiniteScroll()
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        adjustInfiniteScroll()
    }

    private func adjustInfiniteScroll() {
        if isAutoScrolling { return }

        let width = collectionView.bounds.width
        let offset = collectionView.contentOffset.x
        let index = Int(round(offset / width))

        if index == 0 {
            autoIndex = infiniteItems.count - 2
            jumpTo(index: autoIndex)
        } else if index == infiniteItems.count - 1 {
            autoIndex = 1
            jumpTo(index: 1)
        } else {
            autoIndex = index
        }
    }

    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return infiniteItems.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CarouselCell",
            for: indexPath
        ) as! CarouselCell

        cell.configure(with: infiniteItems[indexPath.item])
        return cell
    }
}
