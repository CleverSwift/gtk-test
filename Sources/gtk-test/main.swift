//
// Created by aschulz on 04.05.16.
//

import Gtk

let app = SWGtkApplication(id: "de.aschulz.test", flag: .None)

app.connect(signal: "activate") {
    let window = SWGtkApplicationWindow(app: app)
    window.setDefaultSize(width: 600, height: 400)

    let headerBar = SWGtkHeaderBar()
    headerBar.showCloseButton = true
    headerBar.title = "Gtk Swift"
    headerBar.hasSubtitle = false

    let button = SWGtkButton()
    let image = SWGtkImage(fromIcon: SWGThemedIcon(iconName: "mail-send-receive-symbolic"), size: .Button)
    button.addWidget(image)
    headerBar.packEnd(button)

    let box = SWGtkBox(orientation: .Horizontal, spacing: 0)
    box.styleContext.addClass("linked")
    let arrowLeftButton = SWGtkButton()
    let arrowLeftImage = SWGtkImage(fromIcon: SWGThemedIcon(iconName: "pan-start-symbolic"), size: .Button)
    arrowLeftButton.addWidget(arrowLeftImage)
    box.addWidget(arrowLeftButton)
    let arrowRightButton = SWGtkButton()
    let arrowRightImage = SWGtkImage(fromIcon: SWGThemedIcon(iconName: "pan-end-symbolic"), size: .Button)
    arrowRightButton.addWidget(arrowRightImage)
    box.addWidget(arrowRightButton)
    headerBar.packStart(box)

    window.titlebar = headerBar

    let buttonBox = SWGtkButtonBox(orientation: .Horizontal)
    window.addWidget(buttonBox)
    let button2 = SWGtkButton(label: "Destroy window")
    button2.connect(signal: "clicked") {
        window.destroy()
    }
    buttonBox.addWidget(button2)
    window.showAll()
}

app.run()
