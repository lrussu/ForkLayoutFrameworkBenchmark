// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import UIKit
import PureLayout

/// A LinkedIn feed item that is implemented with PureLayout code.
class FeedItemPureLayoutView: UIView, DataBinder {

    let actionLabel: UILabel = {
        let l = UILabel()
        l.configureForAutoLayout()
        l.font = UILabel().font ?? UIFont.systemFont(ofSize: 17)
        return l
    }()

    let optionsLabel: UILabel = {
        let l = UILabel()
        l.configureForAutoLayout()
        l.font = UILabel().font ?? UIFont.systemFont(ofSize: 17)
        l.text = "..."
        l.sizeToFit()
        return l
    }()

    let posterImageView: UIImageView = {
        let i = UIImageView(forAutoLayout: ())
        i.image = UIImage(named: "50x50.png")
        i.backgroundColor = UIColor.orange
        i.contentMode = .center
        i.sizeToFit()
        return i
    }()

    let posterNameLabel: UILabel = {
        let l = UILabel(forAutoLayout: ())
        l.backgroundColor = UIColor.yellow
        return l
    }()

    let posterHeadlineLabel: UILabel = {
        let l = UILabel(forAutoLayout: ())
        l.backgroundColor = UIColor.yellow
        l.numberOfLines = 3
        return l
    }()

    let posterTimeLabel: UILabel  = {
        let l = UILabel(forAutoLayout: ())
        l.backgroundColor = UIColor.yellow
        return l
    }()

    let posterCommentLabel: UILabel = UILabel()

    let contentImageView: UIImageView = {
        let i = UIImageView(forAutoLayout: ())
        i.image = UIImage(named: "350x200.png")
        i.contentMode = .scaleToFill
        i.sizeToFit()
        return i
    }()

    let contentTitleLabel: UILabel = UILabel()
    let contentDomainLabel: UILabel = UILabel()

    let likeLabel: UILabel = {
        let l = UILabel(forAutoLayout: ())
        l.backgroundColor = .green
        l.text = "Like"
        l.sizeToFit()
        return l
    }()

    let commentLabel: UILabel = {
        let l = UILabel(forAutoLayout: ())
        l.text = "Comment"
        l.backgroundColor = .green
        l.textAlignment = .center
        l.sizeToFit()
        return l
    }()

    let shareLabel: UILabel = {
        let l = UILabel(forAutoLayout: ())
        l.text = "Share"
        l.backgroundColor = .green
        l.textAlignment = .right
        l.sizeToFit()
        return l
    }()

    let actorImageView: UIImageView = {
        let i = UIImageView(forAutoLayout: ())
        i.image = UIImage(named: "50x50.png")
        i.sizeToFit()
        return i
    }()

    let actorCommentLabel: UILabel = UILabel(forAutoLayout: ())

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(optionsLabel)
        addSubview(actionLabel)

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

        optionsLabel.autoPinEdge(toSuperviewEdge: .top, withInset: hMargin)
        optionsLabel.autoPinEdge(toSuperviewEdge: .right, withInset: hMargin)

        actionLabel.autoPinEdge(toSuperviewEdge: .top, withInset: hMargin)
        actionLabel.autoPinEdge(toSuperviewEdge: .left, withInset: hMargin)

        posterImageView.autoPinEdge(.top, to: .bottom, of: actionLabel, withOffset: 10)
        posterImageView.autoPinEdge(.left, to: .left, of: actionLabel)

        posterHeadlineLabel.autoAlignAxis(.horizontal, toSameAxisOf: posterImageView)
        posterHeadlineLabel.autoPinEdge(.left, to: .right, of: posterImageView, withOffset: 4)

        posterNameLabel.autoPinEdge(.bottom, to: .top, of: posterHeadlineLabel, withOffset: -vMargin)
        posterNameLabel.autoPinEdge(.left, to: .left, of: posterHeadlineLabel)

        posterTimeLabel.autoPinEdge(.top, to: .bottom, of: posterHeadlineLabel, withOffset: vMargin)
        posterTimeLabel.autoPinEdge(.left, to: .left, of: posterHeadlineLabel)

        posterCommentLabel.autoPinEdge(.top, to: .bottom, of: posterTimeLabel, withOffset: vMargin)
        posterCommentLabel.autoPinEdge(toSuperviewEdge: .left, withInset: hMargin)

        contentImageView.autoPinEdge(.top, to: .bottom, of: posterCommentLabel, withOffset: vMargin)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 999)) {
            contentImageView.autoPinEdge(toSuperviewEdge: .left, withInset: hMargin)
            contentImageView.autoPinEdge(toSuperviewEdge: .right, withInset: hMargin)
        }

        contentTitleLabel.autoPinEdge(.top, to: .bottom, of: contentImageView, withOffset: vMargin)
        contentTitleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: hMargin)

        contentDomainLabel.autoPinEdge(.top, to: .bottom, of: contentTitleLabel, withOffset: vMargin)
        contentDomainLabel.autoPinEdge(toSuperviewEdge: .left, withInset: hMargin)

        likeLabel.autoPinEdge(.top, to: .bottom, of: contentDomainLabel, withOffset: vMargin)
        likeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: hMargin)

        commentLabel.autoPinEdge(.top, to: .top, of: likeLabel)
        commentLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        shareLabel.autoPinEdge(.top, to: .top, of: likeLabel)
        shareLabel.autoPinEdge(toSuperviewEdge: .right, withInset: hMargin)

        actorImageView.autoPinEdge(.top, to: .bottom, of: likeLabel, withOffset: vMargin)
        actorImageView.autoPinEdge(.left, to: .left, of: likeLabel)

        actorCommentLabel.autoAlignAxis(.horizontal, toSameAxisOf: actorImageView, withOffset: 4)
        actorCommentLabel.autoPinEdge(.left, to: .right, of: actorImageView, withOffset: 4)
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
