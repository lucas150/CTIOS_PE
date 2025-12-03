//
//  CarouselView.swift
//

import UIKit

protocol CarouselViewDelegate: AnyObject {
    func carouselView(_ view: CarouselView, didSelectItem index: Int)
}

final class CarouselView: UIView,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout,
    UIScrollViewDelegate {

    // MARK: - Public API
    public var items: [CarouselItem] = [] {
        didSet { reloadData() }
    }

    public weak var delegate: CarouselViewDelegate?
    public var didSelectItem: ((Int) -> Void)?
    public var autoScrollInterval: TimeInterval = 3.0
    public var isAutoScrollEnabled = true {
        didSet { isAutoScrollEnabled ? startTimer() : stopTimer() }
    }


    // MARK: - Internal state
    private var infiniteItems: [CarouselItem] = []
    private var collectionView: UICollectionView!
    private let pageControl = UIPageControl()
    private var timer: Timer?
    private var currentIndex = 0

    private var logicalCount: Int { items.count }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupPageControl()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
        setupPageControl()
    }


    // MARK: - Setup UI

    private func setupCollectionView() {
        let layout = CarouselFlowLayout()
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(CarouselCell.self,
                                forCellWithReuseIdentifier: "CarouselCell")

        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // TAP
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(onTap(_:)))
        collectionView.addGestureRecognizer(tap)
    }

    private func setupPageControl() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.4)
        pageControl.hidesForSinglePage = true

        addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }


    // MARK: - Data Load

    private func reloadData() {
        stopTimer()

        guard logicalCount > 0 else {
            infiniteItems = []
            pageControl.numberOfPages = 0
            collectionView.reloadData()
            return
        }

        pageControl.numberOfPages = logicalCount

        // repeat data to simulate infinite scroll
        let blocks = max(10, 60 / logicalCount)
        infiniteItems = Array(repeating: items, count: blocks).flatMap { $0 }

        collectionView.reloadData()

        DispatchQueue.main.async {
            let middle = blocks / 2
            self.currentIndex = middle * self.logicalCount
            self.collectionView.scrollToItem(
                at: IndexPath(item: self.currentIndex, section: 0),
                at: .centeredHorizontally,
                animated: false
            )
            self.updateBlur()
            self.updatePage()
            self.startTimer()
        }
    }


    // MARK: - Auto Scroll

    private func startTimer() {
        guard isAutoScrollEnabled, logicalCount > 1 else { return }
        timer = Timer.scheduledTimer(withTimeInterval: autoScrollInterval,
                                     repeats: true) { _ in
            self.scrollNext()
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func scrollNext() {
        currentIndex += 1
        if currentIndex >= infiniteItems.count - logicalCount {
            recenter()
        }

        collectionView.scrollToItem(
            at: IndexPath(item: currentIndex, section: 0),
            at: .centeredHorizontally,
            animated: true
        )
    }

    private func recenter() {
        let blocks = infiniteItems.count / logicalCount
        let middle = blocks / 2
        let logical = currentIndex % logicalCount
        currentIndex = middle * logicalCount + logical

        collectionView.scrollToItem(
            at: IndexPath(item: currentIndex, section: 0),
            at: .centeredHorizontally,
            animated: false
        )
    }


    // MARK: - Tap handler

    @objc private func onTap(_ g: UITapGestureRecognizer) {
        let point = g.location(in: collectionView)
        guard let indexPath = collectionView.indexPathForItem(at: point) else { return }

        let logical = indexPath.item % logicalCount
        delegate?.carouselView(self, didSelectItem: logical)
        didSelectItem?(logical)
    }


    // MARK: - Scroll events

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateIndex()
        updateBlur()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { updatePage() }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) { updatePage() }


    private func updateIndex() {
        let centerX = collectionView.bounds.midX + collectionView.contentOffset.x
        let point = CGPoint(x: centerX, y: collectionView.bounds.midY)

        if let ip = collectionView.indexPathForItem(at: point) {
            currentIndex = ip.item
        }
    }

    private func updatePage() {
        guard logicalCount > 0 else { return }
        pageControl.currentPage = currentIndex % logicalCount
    }

    private func updateBlur() {
        let centerX = collectionView.bounds.midX + collectionView.contentOffset.x
        let width = collectionView.bounds.width

        for cell in collectionView.visibleCells {
            guard let ip = collectionView.indexPath(for: cell),
                  let c = cell as? CarouselCell,
                  let attr = collectionView.layoutAttributesForItem(at: ip) else { continue }

            let distance = abs(attr.center.x - centerX)
            let progress = min(1, distance / (width / 2))

            // center stays clean
            let final = progress < 0.20 ? 0 : progress
            c.setBlurProgress(final)
        }
    }


    // MARK: - Data Source

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        infiniteItems.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CarouselCell",
            for: indexPath
        ) as! CarouselCell

        cell.configure(with: infiniteItems[indexPath.item])
        return cell
    }
}
