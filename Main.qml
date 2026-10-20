import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("Hello World")

    // --- DEĞİŞKENLER ---
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light
    property bool isMiniMode: false
    property int sayac: 0 // YENİ: Sayacımız 0'dan başlıyor

    // --- RENKLER ---
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    GridLayout {
        id: grid
        columns: width < 400 ? 1 : 2
        rowSpacing: 0
        columnSpacing: 0
        anchors.fill: parent

        // 1. ÜST/SOL KUTU (Hello World yazan yer)
        Rectangle {
            id: rectangle1
            color: window.lightMode ? window.reallyLight : window.reallyDark
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                Label {
                    id: text1
                    color: window.lightMode ? window.dark : window.light
                    font.pixelSize: 120
                    fontSizeMode: Text.Fit
                    text: qsTr("Hello World")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // 2. ALT/SAĞ KUTU (Butonların olduğu yer)
        Rectangle {
            id: rectangle2
            color: window.lightMode ? window.light : window.dark
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                spacing: 0

                // === YENİ EKLENEN SAYAÇ BÖLÜMÜ ===
                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 20 // Yukarıdan biraz boşluk bırak
                    Layout.bottomMargin: 20 // Alttaki butonlarla arasına boşluk bırak
                    spacing: 15 // Butonlar ve sayı arasındaki boşluk

                    // EKSİ BUTONU (-)
                    Button {
                        text: "-"
                        contentItem: Text {
                            text: parent.text
                            color: window.lightMode ? window.light : window.dark
                            font.pixelSize: 24 // İşaret biraz büyük olsun
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle {
                            implicitWidth: 40 // Kare buton
                            implicitHeight: 40
                            radius: 8
                            color: window.lightMode ? window.dark : window.light
                        }
                        // Sayacı 1 azaltır
                        onClicked: window.sayac = window.sayac - 1
                    }

                    // SAYAÇ SAYISI (Ortada duran yazı)
                    Label {
                        // Sayısal değeri metne çevirip ekrana yazdırır
                        text: window.sayac.toString()
                        color: window.lightMode ? window.dark : window.light
                        font.pixelSize: 36 // Sayı kocaman görünsün
                        font.bold: true
                        Layout.minimumWidth: 40 // Ortadaki alan daralmasın
                        horizontalAlignment: Text.AlignHCenter
                    }

                    // ARTI BUTONU (+)
                    Button {
                        text: "+"
                        contentItem: Text {
                            text: parent.text
                            color: window.lightMode ? window.light : window.dark
                            font.pixelSize: 24
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle {
                            implicitWidth: 40
                            implicitHeight: 40
                            radius: 8
                            color: window.lightMode ? window.dark : window.light
                        }
                        // Sayacı 1 artırır
                        onClicked: window.sayac = window.sayac + 1
                    }
                }
                // === SAYAÇ BÖLÜMÜ BİTİŞ ===

                Item {
                    Layout.fillHeight: true // Eski dostumuz görünmez yay
                }

                // DİĞER BUTONLAR...
                Button {
                    id: button1
                    text: window.lightMode ? qsTr("\u263D  Dark mode") : qsTr("\u263C  Light mode")
                    Layout.bottomMargin: 16
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    contentItem: Text {
                        text: button1.text
                        color: window.lightMode ? window.light : window.dark
                        font: button1.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 36
                        radius: 8
                        color: window.lightMode ? window.dark : window.light
                    }
                    onClicked: window.lightMode = !window.lightMode
                }

                Button {
                    id: button3
                    text: window.isMiniMode ? qsTr("Normal Mod") : qsTr("Mini Mod")
                    Layout.bottomMargin: 16
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    contentItem: Text {
                        text: button3.text
                        color: window.lightMode ? window.light : window.dark
                        font: button3.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 36
                        radius: 8
                        color: window.lightMode ? window.dark : window.light
                    }
                    onClicked: {
                        window.isMiniMode = !window.isMiniMode
                        if (window.isMiniMode) {
                            window.width = window.minimumWidth
                            window.height = window.minimumHeight
                        } else {
                            window.width = 640
                            window.height = 480
                        }
                    }
                }

                Button {
                    id: button2
                    text: qsTr("Çıkış Yap")
                    Layout.bottomMargin: 16
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    contentItem: Text {
                        text: button2.text
                        color: "#ffffff"
                        font: button2.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 36
                        radius: 8
                        color: window.lightMode ? "#d32f2f" : "#b71c1c"
                    }
                    onClicked: Qt.quit()
                }
            }
        }
    }
}