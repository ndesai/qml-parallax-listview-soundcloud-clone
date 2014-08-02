import QtQuick 2.0
import QtQuick.XmlListModel 2.0


XmlListModel {
    id: _XmlListModel
    source: "http://itunes.apple.com/us/rss/topalbums/limit=100/xml"
    namespaceDeclarations: "declare namespace im = 'http://itunes.apple.com/rss'; declare default element namespace 'http://www.w3.org/2005/Atom';"
    query: "/feed/entry"
    XmlRole { name: "identifier"; query: "id/@im:id/string()" }
    XmlRole { name: "title"; query: "im:name/string()" }
    XmlRole { name: "artist"; query: "im:artist/string()" }
    XmlRole { name: "image"; query: "im:image[3]/string()" }
    XmlRole { name: "link"; query: "link/@href/string()" }
    XmlRole { name: "copyright"; query: "rights/string()" }
    XmlRole { name: "releaseDate"; query: "im:releaseDate/@label/string()" }
    XmlRole { name: "price"; query: "im:price/string()" }
}
