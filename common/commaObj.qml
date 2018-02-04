import QtQuick 2.0

Canvas{
    id: commaObj
    height: width / 2 * 3
    property int rotateAngle: 0
    property bool bCommaRotate: false
    property string commaFillColor: 'black'
    property string commaStrokeColor: 'black'
//    property alias fillColor: commaObj.commaFillColor
//    property alias strokeColor: commaObj.commaStrokeColor
//    property alias bRotate: commaObj.bCommaRotate
//    property alias nAngle: commaObj.rotateAngle
    property int radius: width / 4
    property int centerX: radius * 3
    property int centerY: radius * 2
    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = 1
        ctx.fillStyle = commaFillColor
        ctx.strokeStyle = commaStrokeColor
        ctx.beginPath()

        if (bCommaRotate)
        {
            ctx.translate(radius * 3, radius * 2)
           ctx.rotate(rotateAngle)
            centerX = centerX - radius * 3
            centerY = centerY - radius * 2

        }

        ctx.moveTo(centerX+radius, centerY)
        ctx.arc(centerX, centerY, radius, 0, 3.14 / 2, true);
        ctx.moveTo(centerX, centerY + radius)
        ctx.arc(centerX - radius, centerY + radius, radius, 0, 3.14 / 2, false)
        ctx.arc(centerX - radius, centerY, radius * 2, 3.14 / 2,0, true)

        ctx.fill()
        ctx.stroke()

        if (bCommaRotate)
        {
            ctx.resetTransform()
        }
    }
}
