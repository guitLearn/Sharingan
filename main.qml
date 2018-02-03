import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

//    MainForm {
//        anchors.fill: parent
//        mouseArea.onClicked: {
//            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
//        }
//    }
    Canvas{
        id: can
        width: 120; height: 120
        property int centerX: 50
        property int centerY: 50
        property int radius:  20
        property int crcX: 0
        property int crcY: 0
        property int currentRadius: 0
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = 'black'
            ctx.strokeStyle = 'black'
            ctx.lineWidth = 1
            ctx.beginPath()
            currentRadius = radius
            crcX = centerX + currentRadius
            crcY = centerY
            ctx.moveTo(centerX+currentRadius, centerY)
            ctx.arc(centerX, centerY, currentRadius, 0, 3.14 / 2, true);

            ctx.moveTo(centerX, centerY + currentRadius)
            ctx.arc(centerX - currentRadius, centerY + currentRadius, currentRadius, 0, 3.14 / 2, false)

            ctx.arc(centerX - currentRadius, centerY, currentRadius * 2, 3.14 / 2,0, true)
            ctx.fill()
            ctx.stroke()
        }
    }
}
