sub init()
    m.top.functionName = "getcontent"
    m.userList = []
end sub

sub getcontent()
    userContentNode = createObject("roSGNode", "Content")
    rowList = userContentNode.createChild("Content")
    readInternet = createObject("roUrlTransfer")
    readInternet.SetCertificatesFile("common:/certs/ca-bundle.crt")
    readInternet.InitClientCertificates()
    readInternet.setUrl(m.top.contenturi)
    response = ParseJson(readInternet.GetToString())
    id = 0
    for  each item in response.data
        childNode = rowList.createChild("Content")
        childNode.email = item.email
        childNode.id = id
        childNode.avatar = item.avatar
        childNode.fullName = item.first_name
        m.userList.push(childNode)
        id++
    end for
    m.top.content = userContentNode
    m.top.contentList = m.userList
end sub
