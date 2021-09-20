sub init()
    ' get screen size
    screenInfo = CreateObject("roDeviceInfo")
    screenSize = screenInfo.GetDisplaySize()
    boundingRectangle = initiateUserDetailScreen(screenSize)
    initiateUserAvatar(boundingRectangle, "https://images.unsplash.com/photo-1631698394540-eda72e1e1ce5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80")
    inititateUSerEmail(boundingRectangle)
    m.top.observeField("isClicked", "handleBooleanStatus")
    m.top.observeField("selectedUser", "handleSelectedUser")
    ' get a replica from the homscreenContent
end sub


sub handleBooleanStatus()
    if m.top.isClicked = true
        m.userWrapper.visible = true
    else
        m.userWrapper.visible = false
    end if
end sub

function initiateUSerDetailScreen(screenSize)
    ' main rectangle wrapper
    m.userWrapper = m.top.findNode("userWrapper")
    m.userWrapper.width = screenSize.w
    m.userWrapper.height = screenSize.h
    boundingRectangle = m.userWrapper.boundingRect()
    m.userWrapper.visible = false
    return boundingRectangle
end function

sub initiateUserAvatar(boundingRectangle, uri as string)
    ' user Avatar Configuration
    m.userAvatar = m.top.findNode("userAvatar")
    m.userAvatar.width = boundingRectangle.width / 4
    m.userAvatar.height = boundingRectangle.height / 3
    m.userAvatar.uri = uri
    avatarX = (boundingRectangle.width / 2) - (m.userAvatar.width / 2)
    avatarY = (boundingRectangle.height / 2) - (m.userAvatar.height + 25)
    m.userAvatar.translation = [avatarX, avatarY]
end sub

sub inititateUSerEmail(boundingRectangle)
    ' Label -> email ...etc
    m.userEmail = m.top.findNode("userEmail")
    m.userEmail.width = boundingRectangle.width
    m.userEmail.height = boundingRectangle.height
    m.userEmail.horizAlign = "center"
    m.userEmail.vertAlign = "center"
    m.userEmail.text = m.top.email
end sub

sub handleSelectedUser()
    selectedUser = m.top.selectedUser
    m.userEmail.text = selectedUser.email
    m.userAvatar.uri = selectedUser.avatar
end sub


function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    if press then
        if key = "back" and m.top.isClicked = true
            m.top.isClicked = false
            m.top.setFocus(false)
            handled = true
        end if
    end if
    return handled
end function