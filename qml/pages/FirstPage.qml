import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Thumbnailer 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width - x
            x: Theme.horizontalPageMargin
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("WebP-Test")
            }
            ButtonLayout {
                Button {
                    text: qsTr("load webP image")
                    onClicked: {
                        testImage.source = "../assets/test.webp"
                    }
                }
                Button {
                    text: qsTr("load webP thumbnail")
                    onClicked: {
                        testThumbnail.source = "../assets/test.webp"
                    }
                }
            }

            Image {
                id: testImage
                width: parent.width / 2
                height: width
                sourceSize.width: width
                sourceSize.height: height
                x: (parent.width - width ) / 2
                onStatusChanged: {
                    console.log("image staus changed", status);
                    var states = ["Null", "Ready", "Loading", "Error"];
                    for(var s in states) {
                        if(status === Image[states[s]]) {
                            console.log("Status: ", states[s]);
                            break;
                        }
                    }
                }
            }
            Thumbnail {
                id: testThumbnail
                x: (parent.width - width ) / 2
                width: parent.width / 4
                height: width
                sourceSize.width: width
                sourceSize.height: height
                mimeType: "image/webp"
                onStatusChanged: {
                    console.log("thumbnail status changed", status);
                    var states = ["Null", "Ready", "Loading", "Error"];
                    for(var s in states) {
                        if(status === Thumbnail[states[s]]) {
                            console.log("Status: ", states[s]);
                            break;
                        }
                    }
                }
            }
        }
    }
}
