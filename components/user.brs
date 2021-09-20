sub init()
    m.itemposter = m.top.findNode("itemPoster")
    m.itemmask = m.top.findNode("itemMask")
    m.itemlabel = m.top.findNode("itemLabel")
    m.arrayList = createObject("roArray", 0, true)
end sub

sub showcontent()
    m.itemcontent = m.top.itemContent
    m.itemposter.uri = m.itemcontent.avatar
    m.itemlabel.text = m.itemcontent.fullName
    m.arrayList.push(m.itemcontent)
end sub

sub showfocus()
    scale = 1 + (m.top.focusPercent * 0.08)
    m.itemposter.scale = [scale, scale]
end sub

sub showrowfocus()
    m.itemlabel.opacity = m.top.rowFocusPercent
end sub
