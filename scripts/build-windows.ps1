#call me from the root of the repo

#if not exist "build" create the directory
if (!(Test-Path "build")) {
    New-Item -ItemType Directory -Force -Path "build"
}

function BuildWindowsX64() {
    Write-Host "Building Windows binaries for x86_64"

    if((Test-Path "build/win-x64")) {
        Write-Host "Deleting old build files for windows x86_64";
        Remove-Item -Force -Recurse -Path "build/win-x64"
    }
    
    New-Item -ItemType Directory -Force -Path "build/win-x64"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-x64  -A x64
    cmake --build build/win-x64 --config Release
    
    #copy the binaries to runtimes/windows-x64
    cp build/win-x64/bin/Release/whisper.dll ./Whisper.net/runtimes/win-x64/whisper.dll
}

function BuildWindowsX64AVX1() {
    Write-Host "Building Windows binaries for x86_64 AVX1"

    if((Test-Path "build/win-x64-avx1")) {
        Write-Host "Deleting old build files for windows x86_64-avx1";
        Remove-Item -Force -Recurse -Path "build/win-x64-avx1"
    }
    
    New-Item -ItemType Directory -Force -Path "build/win-x64-avx1"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-x64-avx1  -A x64 -DWHISPER_NO_AVX2=ON
    cmake --build build/win-x64-avx1 --config Release
    
    #copy the binaries to runtimes/windows-x64
    cp build/win-x64-avx1/bin/Release/whisper.dll ./Whisper.net/runtimes/win-x64-avx1/whisper.dll
}

function BuildWindowsX64NoAVX() {
    Write-Host "Building Windows binaries for x86_64 without AVX"

    if((Test-Path "build/win-x64-noavx")) {
        Write-Host "Deleting old build files for windows x86_64-noavx";
        Remove-Item -Force -Recurse -Path "build/win-x64-noavx"
    }
    
    New-Item -ItemType Directory -Force -Path "build/win-x64-noavx"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-x64-noavx  -A x64 -DWHISPER_NO_AVX=ON
    cmake --build build/win-x64-noavx --config Release
    
    #copy the binaries to runtimes/windows-x64
    cp build/win-x64-noavx/bin/Release/whisper.dll ./Whisper.net/runtimes/win-x64-noavx/whisper.dll
}

function BuildWindowsX86() {
    Write-Host "Building Windows binaries for x86"

    if((Test-Path "build/win-x86")) {
        Write-Host "Deleting old build files for windows x86";
        Remove-Item -Force -Recurse -Path "build/win-x86"
    }
    
    New-Item -ItemType Directory -Force -Path "build/win-x86"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-x86  -A Win32
    cmake --build build/win-x86 --config Release
    
    #copy the binaries to runtimes/windows-x86
    cp build/win-x86/bin/Release/whisper.dll ./Whisper.net/runtimes/win-x86/whisper.dll
}

function BuildWindowsX86AVX1() {
    Write-Host "Building Windows binaries for x86 AVX1"

    if((Test-Path "build/win-x86-avx1")) {
        Write-Host "Deleting old build files for windows x86-avx1";
        Remove-Item -Force -Recurse -Path "build/win-x86-avx1"
    }
    
    New-Item -ItemType Directory -Force -Path "build/win-x86-avx1"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-x86-avx1  -A Win32 -DWHISPER_NO_AVX2=ON
    cmake --build build/win-x86-avx1 --config Release
    
    #copy the binaries to runtimes/windows-x86
    cp build/win-x86-avx1/bin/Release/whisper.dll ./Whisper.net/runtimes/win-x86-avx1/whisper.dll
}

function BuildWindowsX86NoAVX() {
    Write-Host "Building Windows binaries for x86 without AVX"

    if((Test-Path "build/win-x86-noavx")) {
        Write-Host "Deleting old build files for windows x86-noavx";
        Remove-Item -Force -Recurse -Path "build/win-x86-noavx"
    }
    
    New-Item -ItemType Directory -Force -Path "build/win-x86-noavx"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-x86-noavx  -A Win32 -DWHISPER_NO_AVX=ON
    cmake --build build/win-x86-noavx --config Release
    
    #copy the binaries to runtimes/windows-x64
    cp build/win-x86-noavx/bin/Release/whisper.dll ./Whisper.net/runtimes/win-x86-noavx/whisper.dll
}

function BuildWindowsArm64() {
    Write-Host "Building Windows binaries for arm64"

    if((Test-Path "build/win-arm64")) {
        Write-Host "Deleting old build files for windows arm64";
        Remove-Item -Force -Recurse -Path "build/win-arm64"
    }
    
    New-Item -ItemType Directory -Force -Path "build/win-arm64"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-arm64  -A ARM64
    cmake --build build/win-arm64 --config Release
    
    #copy the binaries to runtimes/windows-arm64
    cp build/win-arm64/bin/Release/whisper.dll ./Whisper.net/runtimes/win-arm64/whisper.dll
}

function BuildWindowsArm() {
    Write-Host "Building Windows binaries for arm"

    if((Test-Path "build/win-arm")) {
        Write-Host "Deleting old build files for windows arm";
        Remove-Item -Force -Recurse -Path "build/win-arm"
    }
    
    New-Item -ItemType Directory -Force -Path "build/windows-arm"
    
    #call CMake to generate the makefiles
    cmake -S . -B build/win-arm  -A ARM
    cmake --build build/win-arm --config Release
    
    #copy the binaries to runtimes/windows-arm
    cp build/win-arm/bin/Release/whisper.dll ./Whisper.net/runtimes/win-arm/whisper.dll
}

BuildWindowsX64
BuildWindowsX64AVX1
BuildWindowsX64NoAVX
BuildWindowsX86
BuildWindowsX86AVX1
BuildWindowsX86NoAVX
BuildWindowsArm
BuildWindowsArm64
