//
//  CalendarCollectionViewCell.swift
//  Myrror
//
//  Created by Lais Godinho on 15/09/22.
//

import UIKit
import Lottie

class CalendarCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    lazy var dayOfMonth: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.font = .preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var moodOfTheDay: UIImageView = {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 0.5 * 0.6 * contentView.bounds.size.width
//        return view
//    }()
//
    let moodOfTheDay: AnimationView = {
        let animationView = AnimationView()
        
        animationView.animation = Animation.named("desesperado")
        
        animationView.contentMode = .scaleAspectFit
        animationView.layer.cornerRadius = 8
        animationView.accessibilityLabel = "desesperado"
        animationView.isAccessibilityElement = true
        animationView.translatesAutoresizingMaskIntoConstraints = false
//        animationView.backgroundColor = .systemBlue
        return animationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.contentView.backgroundColor = .white
        self.contentView.addSubview(dayOfMonth)
        self.contentView.addSubview(moodOfTheDay)
        moodOfTheDay.layer.cornerRadius = 0.5 * 0.6 * contentView.bounds.size.width
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not  been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfMonth.topAnchor.constraint(equalTo: contentView.topAnchor),
            dayOfMonth.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            moodOfTheDay.topAnchor.constraint(equalTo: dayOfMonth.bottomAnchor),
            moodOfTheDay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moodOfTheDay.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            moodOfTheDay.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)
        ])
    }
    
    func configure(day: String, hide: Bool, selectedDate: Date) {
        let selectedDateComponents = Calendar.current.dateComponents([.month, .year], from: selectedDate)
        let currentDateComponents = Calendar.current.dateComponents([.month, .year], from: Date())
        let currentDay = Calendar.current.dateComponents([.day], from: Date())
        let selectedDay = Calendar.current.dateComponents([.day], from: selectedDate)
        

        let isCurrentDate = selectedDateComponents == currentDateComponents && day == String(currentDay.day!)
        let isSelectedDate = day == String(selectedDay.day!)
        
        if isCurrentDate {
            dayOfMonth.textColor = .tintColor
        }
        
        if !isCurrentDate && isSelectedDate {
            dayOfMonth.textColor = UIColor.black
        }
        
        if !isCurrentDate && !isSelectedDate {
            dayOfMonth.textColor = UIColor(named: "TextColor")
        }
        dayOfMonth.text = day
        

        if(hide) {
            moodOfTheDay.backgroundColor = .clear
            moodOfTheDay.animation = nil
        } else {
            moodOfTheDay.backgroundColor = .systemGray5
            moodOfTheDay.animation = Animation.named("desesperado")
            
        }
        
    }
}
