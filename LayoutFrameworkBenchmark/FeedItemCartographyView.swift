// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import UIKit
import Cartography

/// A LinkedIn feed item that is implemented with PinLayout code.
class FeedItemCartographyView: UIView, DataBinder {

    let actionLabel: UILabel = {
        let l = UILabel()
        l.font = UILabel().font ?? UIFont.systemFont(ofSize: 17)
        return l
    }()

    let optionsLabel: UILabel = {
        let l = UILabel()
        l.font = UILabel().font ?? UIFont.systemFont(ofSize: 17)
        l.text = "..."
        l.sizeToFit()
        return l
    }()

    let posterImageView: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "50x50.png")
        i.backgroundColor = UIColor.orange
        i.contentMode = .center
        i.sizeToFit()
        return i
    }()

    let posterNameLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = UIColor.yellow
        return l
    }()

    let posterHeadlineLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = UIColor.yellow
        l.numberOfLines = 3
        return l
    }()

    let posterTimeLabel: UILabel  = {
        let l = UILabel()
        l.backgroundColor = UIColor.yellow
        return l
    }()

    let posterCommentLabel: UILabel = UILabel()

    let contentImageView: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "350x200.png")
        i.contentMode = .scaleToFill
        i.sizeToFit()
        return i
    }()

    let contentTitleLabel: UILabel = UILabel()
    let contentDomainLabel: UILabel = UILabel()

    let likeLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = .green
        l.text = "Like"
        l.sizeToFit()
        return l
    }()

    let commentLabel: UILabel = {
        let l = UILabel()
        l.text = "Comment"
        l.backgroundColor = .green
        l.textAlignment = .center
        l.sizeToFit()
        return l
    }()

    let shareLabel: UILabel = {
        let l = UILabel()
        l.text = "Share"
        l.backgroundColor = .green
        l.textAlignment = .right
        l.sizeToFit()
        return l
    }()

    let actorImageView: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "50x50.png")
        i.sizeToFit()
        return i
    }()

    let actorCommentLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(actionLabel)
        addSubview(optionsLabel)
        addSubview(posterImageView)
        addSubview(posterNameLabel)
        addSubview(posterHeadlineLabel)
        addSubview(posterTimeLabel)
        addSubview(posterCommentLabel)
        addSubview(contentImageView)
        addSubview(contentTitleLabel)
        addSubview(contentDomainLabel)
        addSubview(likeLabel)
        addSubview(commentLabel)
        addSubview(shareLabel)
        addSubview(actorImageView)
        addSubview(actorCommentLabel)
        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(_ data: FeedItemData) {
        actionLabel.text = data.actionText
        actionLabel.sizeToFit()

        posterNameLabel.text = data.posterName
        posterNameLabel.sizeToFit()

        posterHeadlineLabel.text = data.posterHeadline
        posterHeadlineLabel.sizeToFit()

        posterTimeLabel.text = data.posterTimestamp
        posterTimeLabel.sizeToFit()

        posterCommentLabel.text = data.posterComment

        contentTitleLabel.text = data.contentTitle
        contentTitleLabel.sizeToFit()

        contentDomainLabel.text = data.contentDomain
        contentDomainLabel.sizeToFit()

        actorCommentLabel.text = data.actorComment
        actorCommentLabel.sizeToFit()
        setNeedsLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let hMargin: CGFloat = 8
        let vMargin: CGFloat = 4


        constrain(optionsLabel) { view in
            view.top == view.superview!.top + hMargin
            view.right == view.superview!.right - hMargin
        }

        constrain(actionLabel) { view in
            view.top == view.superview!.top + hMargin
            view.left == view.superview!.left + hMargin
        }

        constrain(posterImageView, actionLabel) { view1, view2 in
            view1.top == view2.bottom + 10
            view1.left == view1.superview!.left + hMargin
        }

        constrain(posterHeadlineLabel, posterImageView) { view1, view2 in
            view1.centerY == view2.centerY
            view1.left == view2.right + 4
        }

        constrain(posterNameLabel, posterHeadlineLabel) { view1, view2 in
            view1.bottom == view2.top - vMargin
            view1.left == view2.left
        }

        constrain(posterTimeLabel, posterHeadlineLabel) { view1, view2 in
            view1.top == view2.bottom + vMargin
            view1.left == view2.left
        }

        constrain(posterCommentLabel, posterTimeLabel) { view1, view2 in
            view1.top == view2.bottom + vMargin
            view1.left == view1.superview!.left + hMargin
        }

        constrain(contentImageView, posterCommentLabel) { view1, view2 in
            view1.top == view2.bottom + vMargin
            view1.left == view1.superview!.left + hMargin ~ UILayoutPriority(999)
            view1.right == view1.superview!.right - hMargin ~ UILayoutPriority(999)
        }

        constrain(contentTitleLabel, contentImageView) { view1, view2 in
            view1.top == view2.bottom + vMargin
            view1.left == view1.superview!.left + hMargin
        }

        constrain(contentDomainLabel, contentTitleLabel) { view1, view2 in
            view1.top == view2.bottom + vMargin
            view1.left == view1.superview!.left + hMargin
        }

        constrain(likeLabel, contentDomainLabel) { view1, view2 in
            view1.top == view2.bottom + vMargin
            view1.left == view2.left
        }

        constrain(commentLabel, likeLabel) { view1, view2 in
            view1.top == view2.top
            view1.centerX == view1.superview!.centerX
        }

        constrain(shareLabel, likeLabel) { view1, view2 in
            view1.top == view2.top
            view1.right == view1.superview!.right - hMargin
        }

        constrain(actorImageView, likeLabel) { view1, view2 in
            view1.top == view2.bottom + vMargin
            view1.left == view2.left
        }

        constrain(actorCommentLabel, actorImageView) { view1, view2 in
            view1.centerY == view2.centerY + 4
            view1.left == view2.right + 4
        }
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        layoutSubviews()
        return CGSize(width: size.width, height: max(actorImageView.frame.maxY, actorCommentLabel.frame.maxY) + 4)
    }

    override var intrinsicContentSize: CGSize {
        return sizeThatFits(CGSize(width: frame.width, height: .greatestFiniteMagnitude))
    }
}
