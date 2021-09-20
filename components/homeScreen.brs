sub init()
    m.rowlist = m.top.findNode("mainRowList")
    ' task component api call + content state management
    m.taskComponent = createObject("roSGNode", "taskComponent")
    m.taskComponent.observeField("content", "setContent")
    m.taskComponent.observeField("contentList", "handleContentList")

    m.taskComponent.contenturi = "https://reqres.in/api/users?page=2"
    m.taskComponent.control = "RUN"
    ' user dets is clicked observer
    m.userDetailScreen = m.top.findNode("userDetailScreen")
    m.userDetailScreen.observeField("isClicked", "setFocusFormHomeScreen")
    m.top.setFocus(true)
end sub

sub setContent()
    m.rowlist.content = m.taskComponent.content
end sub

sub setFocusFormHomeScreen()
    m.rowlist.setFocus(true)
end sub

sub handleContentList()
    m.taskComponentContentList = m.taskComponent.contentList
end sub

' connecting the selected user to be displayed to the userdets screen
sub setInfoForUSerDetailScreen()
    currentSlectedUser = m.rowlist.rowItemSelected[1]
    for each item in m.taskComponentContentList
        parsedITem = StrToI(item.id)
        if(parsedITem = currentSlectedUser) then
            m.userDetailScreen.selectedUser = item
        end if
    end for
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    if key = "OK"then
        m.userDetailScreen.isClicked = true
        setInfoForUSerDetailScreen()
        m.userDetailScreen.setFocus(true)
    end if
    return handled
end function