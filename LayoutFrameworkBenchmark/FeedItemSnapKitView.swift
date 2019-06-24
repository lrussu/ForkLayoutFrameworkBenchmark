// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import UIKit
import SnapKit

/// A LinkedIn feed item that is implemented with SnapKit code.
class FeedItemSnapKitView: UIView, DataBinder {

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

        optionsLabel.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview().inset(hMargin).labeled("TOP-RIGHT-optionsLabel-superview")
        }

        actionLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(hMargin).labeled("TOP-RIGHT-actionLabel-superview")
        }

        posterImageView.snp.makeConstraints { (make) in
            make.top.equalTo(actionLabel.snp.bottom).offset(10)
            make.left.equalToSuperview()
        }

        posterHeadlineLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(posterImageView)
            make.left.equalTo(posterImageView.snp.right).offset(4)
        }

        posterNameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(posterHeadlineLabel.snp.top).offset(-vMargin)
            make.left.equalTo(posterHeadlineLabel)
        }

        posterTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(posterHeadlineLabel.snp.bottom).offset(vMargin)
            make.left.equalTo(posterHeadlineLabel)
        }

        posterCommentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(posterTimeLabel.snp.bottom).offset(vMargin)
            make.left.equalToSuperview().offset(hMargin)
        }

        contentImageView.snp.makeConstraints { (make) in
            make.top.equalTo(posterCommentLabel.snp.bottom).offset(vMargin)
            make.left.equalToSuperview().offset(hMargin).priority(999)
            make.right.equalToSuperview().offset(-hMargin).priority(999)
        }

        contentTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentImageView.snp.bottom).offset(vMargin)
            make.left.equalToSuperview().offset(hMargin)
        }

        contentDomainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentTitleLabel.snp.bottom).offset(vMargin)
            make.left.equalToSuperview().offset(hMargin)
        }

        likeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentDomainLabel.snp.bottom).offset(vMargin)
            make.left.equalTo(contentDomainLabel)
        }

        commentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(likeLabel).offset(vMargin)
            make.centerX.equalToSuperview()
        }

        shareLabel.snp.makeConstraints { (make) in
            make.top.equalTo(likeLabel).offset(vMargin)
            make.right.equalToSuperview().offset(-hMargin)
        }

        actorImageView.snp.makeConstraints { (make) in
            make.top.equalTo(likeLabel.snp.bottom).offset(vMargin)
            make.left.equalTo(likeLabel)
        }

        actorCommentLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(actorImageView).offset(4)
            make.left.equalTo(actorImageView.snp.right).offset(4)
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
