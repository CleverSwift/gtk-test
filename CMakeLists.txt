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
        Sources/main.swift
        Sources/SWCallbackContainer.swift
        Sources/SWGApplication.swift
        Sources/SWGApplicationFlags.swift
        Sources/SWGConnectFlags.swift
        Sources/SWGIcon.swift
        Sources/SWGObject.swift
        Sources/SWGThemedIcon.swift
        Sources/SWGtkApplication.swift
        Sources/SWGtkApplicationWindow.swift
        Sources/SWGtkBin.swift
        Sources/SWGtkBox.swift
        Sources/SWGtkButton.swift
        Sources/SWGtkButtonBox.swift
        Sources/SWGtkContainer.swift
        Sources/SWGtkHeaderBar.swift
        Sources/SWGtkIconSize.swift
        Sources/SWGtkImage.swift
        Sources/SWGtkMisc.swift
        Sources/SWGtkOrientation.swift
        Sources/SWGtkStyleContext.swift
        Sources/SWGtkWidget.swift
        Sources/SWGtkWindow.swift)
