import QtQuick 2.6
import QtQuick.Window 2.2
import "common"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    function calcPos(x0, y0, x1, radius, bPositive){
        if (bPositive)
        {
            return Math.sqrt(radius * radius - (x0 - x1) * (x0 - x1)) + y0;
        }
        else
        {
            return -Math.sqrt(radius * radius - (x0 - x1) * (x0 - x1)) + y0;
        }
    }



        Canvas{
            id:singleHookJade
            x:100
            y:50
            width:300
            height: 300

            onPaint: {
                var ctx = singleHookJade.getContext('2d')

                ctx.fillStyle = 'red'
                ctx.strokeStyle = 'black'

                ctx.beginPath()
                ctx.ellipse(30, 30, 100, 100)
                ctx.ellipse(40, 40, 80, 80)
                ctx.fill()

                ctx.stroke()
            }

            CommaObj {
                property int centerX: 100
                property int centerY: calcPos(80, 80, centerX, 40, true)
                width: 20
                x: centerX - width / 4 * 3
                y: centerY - width / 4 * 2
                commaFillColor: 'black'
                commaStrokeColor:'black'
            }

            CommaObj {
                property int centerX: 60
                property int centerY: calcPos(80, 80, centerX, 40, false)
                width: 20
                x: centerX - width / 4 * 3
                y: centerY - width / 4 * 2
                commaFillColor: 'black'
                commaStrokeColor:'black'
                bCommaRotate: true
                rotateAngle: Math.PI
            }
        }




//    Canvas{
//        id:comma

//        onPaint: {
//            var ctx = comma.getContext('2d')
//            ctx.fillStyle = 'black'
//            ctx.strokeStyle = 'black'
//        }
//    }



//    MainForm {
//        anchors.fill: parent
//        mouseArea.onClicked: {
//            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
//        }
//    }
//    Canvas{
//        id: can
//        width: 120; height: 120
//        property int centerX: 50
//        property int centerY: 50
//        property int radius:  20
//        property int crcX: 0
//        property int crcY: 0
//        property int currentRadius: 0
//        onPaint: {
//            var ctx = getContext("2d");
//            ctx.lineWidth = 1

//            currentRadius = radius
//            crcX = centerX + currentRadius
//            crcY = centerY

//            ctx.beginPath()
//            ctx.fillStyle = 'red'
//            ctx.strokeStyle = 'black'

//            ctx.ellipse(80, 80, 20, 20)
//            ctx.ellipse(70, 70, 40, 40)
//            ctx.fill()
//            ctx.stroke()

//            ctx.fillStyle = 'black'
//            ctx.strokeStyle = 'black'

//            ctx.beginPath()
//            ctx.moveTo(centerX+currentRadius, centerY)


//            ctx.arc(centerX, centerY, currentRadius, 0, 3.14 / 2, true);

//            ctx.moveTo(centerX, centerY + currentRadius)
//            ctx.arc(centerX - currentRadius, centerY + currentRadius, currentRadius, 0, 3.14 / 2, false)

//            ctx.arc(centerX - currentRadius, centerY, currentRadius * 2, 3.14 / 2,0, true)
//            ctx.fill()
//            ctx.stroke()

//            ctx.beginPath()
//            ctx.translate(centerX, centerY)
//            ctx.rotate(Math.PI)
//            ctx.moveTo(currentRadius, 0)


//            ctx.arc(0, 0, currentRadius, 0, 3.14 / 2, true);

//            ctx.moveTo(0, currentRadius)
//            ctx.arc(- currentRadius,  currentRadius, currentRadius, 0, 3.14 / 2, false)

//            ctx.arc(- currentRadius, 0, currentRadius * 2, 3.14 / 2,0, true)
//            ctx.fill()
//            ctx.stroke()
//        }
//    }
}
