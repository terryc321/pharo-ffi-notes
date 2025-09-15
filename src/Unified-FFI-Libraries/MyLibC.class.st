Class {
	#name : 'MyLibC',
	#superclass : 'FFILibrary',
	#category : 'Unified-FFI-Libraries',
	#package : 'Unified-FFI-Libraries'
}

{ #category : 'as yet unclassified' }
MyLibC >> macLibraryName [
^ 'libc.dylib'
]

{ #category : 'as yet unclassified' }
MyLibC >> unix64LibraryName [
"On different flavors of Linux, the path to the library may
differ, depending on the distro and whether the system is 32- or
64-bit."
#('/usr/lib/x86_64-linux-gnu/libcairo.so'
'''/usr/lib/i386-linux-gnu/libcairo.so.2'
'/usr/lib32/libcairo.so.2'
'/usr/lib/libcairo.so.2' ) do: [ :path |
path asFileReference exists ifTrue: [ ^ path ] ].
self error: 'Cannot locate Cairo library. Please check that it is installed on your system.'


]

{ #category : 'as yet unclassified' }
MyLibC >> unixLibraryName [
^ 'libc.so.6'
]

{ #category : 'as yet unclassified' }
MyLibC >> win32LibraryName [
"While not poroper libc MSVCRT has the functions we need here"
^ 'mscvcrt.dll'


]
