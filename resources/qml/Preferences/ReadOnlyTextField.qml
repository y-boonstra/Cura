// Copyright (c) 2016 Ultimaker B.V.
// Uranium is released under the terms of the AGPLv3 or higher.

import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.2

Item
{
    id: base

    property alias text: textField.text

    signal editingFinished();

    property bool readOnly: false

    width: textField.width
    height: textField.height

    TextField
    {
        id: textField

        enabled: !base.readOnly
        opacity: base.readOnly ? 0.5 : 1.0

        anchors.fill: parent

        onEditingFinished: base.editingFinished()
    }

    Label
    {
        visible: base.readOnly
        text: textField.text

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: textField.__panel ? textField.__panel.leftMargin : 0

        color: palette.buttonText
    }

    SystemPalette { id: palette }
}
