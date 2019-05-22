cmake_minimum_required(VERSION 3.5)
project(gtk-test)

if(UNIX AND NOT APPLE)
    set(LINUX true)
endif()

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(OSX true)
endif()

if(LINUX)
    set(LIBS
        -Xcc -I/usr/include/cairo
        -Xcc -I/usr/include/gtk-3.0
        -Xcc -I/usr/include/glib-2.0
        -Xcc -I/usr/include/pango-1.0
        -Xcc -I/usr/include/gdk-pixbuf-2.0
        -Xcc -I/usr/include/atk-1.0
        -Xcc -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
        -Xcc -I/usr/lib/glib-2.0/include
        )
endif()

if(OSX)
    set(LIBS
        -Xlinker -L/usr/local/lib/
        -Xcc -I/usr/local/include/cairo
        -Xcc -I/usr/local/include/gtk-3.0
        -Xcc -I/usr/local/include/glib-2.0
        -Xcc -I/usr/local/include/pango-1.0
        -Xcc -I/usr/local/include/gdk-pixbuf-2.0
        -Xcc -I/usr/local/include/atk-1.0
        -Xcc -I/usr/local/lib/glib-2.0/include
        )
endif()

add_custom_target(gtk-test
    COMMAND swift build ${LIBS}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    SOURCES
        Package.swift
        Sources/gtk-test/main.swift
        Sources/gtk-test/SWCallbackContainer.swift
        Sources/gtk-test/SWGApplication.swift
        Sources/gtk-test/SWGApplicationFlags.swift
        Sources/gtk-test/SWGConnectFlags.swift
        Sources/gtk-test/SWGIcon.swift
        Sources/gtk-test/SWGObject.swift
        Sources/gtk-test/SWGThemedIcon.swift
        Sources/gtk-test/SWGtkApplication.swift
        Sources/gtk-test/SWGtkApplicationWindow.swift
        Sources/gtk-test/SWGtkBin.swift
        Sources/gtk-test/SWGtkBox.swift
        Sources/gtk-test/SWGtkButton.swift
        Sources/gtk-test/SWGtkButtonBox.swift
        Sources/gtk-test/SWGtkContainer.swift
        Sources/gtk-test/SWGtkHeaderBar.swift
        Sources/gtk-test/SWGtkIconSize.swift
        Sources/gtk-test/SWGtkImage.swift
        Sources/gtk-test/SWGtkMisc.swift
        Sources/gtk-test/SWGtkOrientation.swift
        Sources/gtk-test/SWGtkStyleContext.swift
        Sources/gtk-test/SWGtkWidget.swift
        Sources/gtk-test/SWGtkWindow.swift)
